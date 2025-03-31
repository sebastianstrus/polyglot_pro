//
//  SelectLanguageView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI

struct SelectLanguageView: View {
    @EnvironmentObject var settings: SettingsManager
    
    @State private var tempPrimaryLanguage: Language? = .english
    @State private var tempTargetLanguage: Language = .swedish // Default
    @State private var isSameLanguage: Bool = false
    
    @State private var scrollOffset: CGFloat = 0
    @State private var selectedIndex: Int = 0
    
    let languages = Language.allCases
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Select primary language:".localized)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
            
            LanguageScrollView(selectedIndex: $selectedIndex, languages: languages) { language in
                tempPrimaryLanguage = language
            }
            
            Text("Select target language:".localized)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
            
            Spacer()
            
            LanguageScrollView(selectedIndex: .constant(languages.firstIndex(of: .swedish) ?? 0), languages: [Language.swedish]) { language in
                tempTargetLanguage = language
            }
            
            Text("The languages must be different.".localized)
                .font(.system(size: 12))
                .foregroundColor(.red)
                .opacity(isSameLanguage ? 1 : 0)
            
            NavigationLink(value: Destination.main) {
                Text("Continue".localized)
                    .styledButton(.secondary)
            }
            .buttonStyle(ScaleButtonStyle())
            .onTapGesture {
                guard tempPrimaryLanguage != tempTargetLanguage else {
                    isSameLanguage = true
                    return
                }
                settings.savePrimaryLanguage(tempPrimaryLanguage)
                settings.targetLanguage = tempTargetLanguage
            }
            
            Spacer()
        }
        .padding()
        .frame(width: 300, height: 420, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: 3)
                .shadow(color: .purple.opacity(0.5), radius: 20)
        )
    }
}

struct LanguageScrollView: View {
    @Binding var selectedIndex: Int
    let languages: [Language]
    let onSelect: (Language) -> Void
    
    @State private var scrollOffset: CGFloat = 0
    @State private var scrollViewWidth: CGFloat = 0
    @State private var isDragging = false
    @State private var proxy: ScrollViewProxy? = nil
    @State private var visibleItems: [Int: CGRect] = [:]
    @State private var closestIndex: Int = 0
    @State private var timer: Timer? = nil
    @State private var isScrolling = false
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let itemWidth: CGFloat = 100
                let spacing: CGFloat = 10
                let midX = geometry.size.width / 2
                
                ScrollViewReader { scrollProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: spacing) {
                            ForEach(languages.indices, id: \.self) { index in
                                VStack(spacing: 0) {
                                    Text(languages[index].flag).font(Font.system(size: 52))
                                    Text(languages[index].displayName).font(.system(size: 14, weight: .bold, design: .rounded))
                                }
                                .frame(width: 96, height: 90)
                                .padding(.bottom, 6)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(
                                            LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing),
                                            lineWidth: 5
                                        )
                                        .opacity(shouldShowBorder(for: index) ? 1.0 : 0.0)
                                )
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectAndCenter(index: index, proxy: scrollProxy)
                                }
                                .background(
                                    GeometryReader { geo in
                                        Color.clear
                                            .preference(
                                                key: VisibleItemPreferenceKey.self,
                                                value: [index: geo.frame(in: .named("scroll"))]
                                            )
                                    }
                                )
                                .id(index)
                            }
                        }
                        .padding(.horizontal, midX - itemWidth / 2)
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .preference(
                                        key: ScrollOffsetPreferenceKey.self,
                                        value: geo.frame(in: .named("scroll")).minX
                                    )
                                    .onAppear {
                                        scrollViewWidth = geometry.size.width
                                        self.proxy = scrollProxy
                                        self.closestIndex = selectedIndex
                                        selectAndCenter(index: selectedIndex, proxy: scrollProxy)
                                    }
                            }
                        )
                    }
                    .coordinateSpace(name: "scroll")
                    .onPreferenceChange(VisibleItemPreferenceKey.self) { value in
                        visibleItems = value
                        updateClosestIndex()
                    }
                    .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                        scrollOffset = value
                        if isDragging || isScrolling {
                            checkForScrollStop()
                        }
                    }
                }
            }
            .frame(height: 100)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { _ in
                        isDragging = true
                        isScrolling = true
                        timer?.invalidate()
                    }
                    .onEnded { _ in
                        isDragging = false
                        // Immediately update to the closest index when dragging ends
                        updateSelectionToClosestIndex()
                    }
            )
            
            // Gradient overlays
            HStack {
                LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .leading, endPoint: .trailing)
                    .frame(width: 80, height: 100)
                
                Spacer()
                
                LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .leading, endPoint: .trailing)
                    .frame(width: 80, height: 100)
            }
            .allowsHitTesting(false)
        }
    }
    
    private func shouldShowBorder(for index: Int) -> Bool {
        // During scroll (either dragging or momentum), show closest item
        // When completely stopped, show selected item
        return (isDragging || isScrolling) ? (closestIndex == index) : (selectedIndex == index)
    }
    
    private func selectAndCenter(index: Int, proxy: ScrollViewProxy) {
        guard languages.indices.contains(index) else { return }
        
        selectedIndex = index
        closestIndex = index
        onSelect(languages[index])
        withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7)) {
            proxy.scrollTo(index, anchor: .center)
        }
    }
    
    private func updateClosestIndex() {
        let centerX = scrollViewWidth / 2
        var newClosestIndex = selectedIndex
        var smallestDistance = CGFloat.greatestFiniteMagnitude
        
        for (index, frame) in visibleItems {
            let itemCenterX = frame.midX - scrollOffset
            let distance = abs(itemCenterX - centerX)
            
            if distance < smallestDistance {
                smallestDistance = distance
                newClosestIndex = index
            }
        }
        
        closestIndex = newClosestIndex
    }
    
    private func checkForScrollStop() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
            // Check if scroll position has stabilized
            let previousOffset = scrollOffset
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                if abs(previousOffset - scrollOffset) < 1 {
                    isScrolling = false
                    updateSelectionToClosestIndex()
                } else {
                    checkForScrollStop()
                }
            }
        }
    }
    
    private func updateSelectionToClosestIndex() {
        guard languages.indices.contains(closestIndex) else { return }
        
        selectedIndex = closestIndex
        onSelect(languages[closestIndex])
        
        if let proxy = proxy {
            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7)) {
                proxy.scrollTo(closestIndex, anchor: .center)
            }
        }
    }
}
// Preference Keys
struct VisibleItemPreferenceKey: PreferenceKey {
    static var defaultValue: [Int: CGRect] = [:]
    
    static func reduce(value: inout [Int: CGRect], nextValue: () -> [Int: CGRect]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
/*
struct SelectLanguageView: View {
    @EnvironmentObject var settings: SettingsManager
    
    @State private var tempPrimaryLanguage: Language?
    @State private var tempTargetLanguage: Language = .swedish // Default
    @State private var isSameLanguage: Bool = false
    @State private var selectedIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    
    let languages = Language.allCases
    let itemWidth: CGFloat = 100
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Select primary language:".localized)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
            
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    ForEach(languages.indices, id: \.self) { index in
                        Text(languages[index].displayName)
                            .frame(width: itemWidth, height: 40)
                            .background(selectedIndex == index ? Color.blue.opacity(0.3) : Color.clear)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .offset(x: -CGFloat(selectedIndex) * itemWidth + dragOffset)
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            state = value.translation.width
                        }
                        .onEnded { value in
                            let threshold: CGFloat = itemWidth / 2
                            let newIndex = selectedIndex - Int(value.translation.width / threshold)
                            selectedIndex = max(0, min(newIndex, languages.count - 1))
                        }
                )
                .animation(.spring(), value: selectedIndex)
            }
            .frame(height: 50)
            .padding(.bottom)
            
            Text("The languages must be different.".localized)
                .font(.system(size: 12))
                .foregroundColor(.red)
                .opacity(isSameLanguage ? 1 : 0)
            
            NavigationLink(value: Destination.main) {
                Text("Continue".localized)
                    .styledButton(.secondary)
            }
            .buttonStyle(ScaleButtonStyle())
            .onTapGesture {
                guard tempPrimaryLanguage != tempTargetLanguage else {
                    isSameLanguage = true
                    return
                }
                settings.savePrimaryLanguage(tempPrimaryLanguage)
                settings.targetLanguage = tempTargetLanguage
            }
            
            Spacer()
        }
        .padding()
        .frame(width: 300, height: 380, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: 3)
                .shadow(color: .purple.opacity(0.5), radius: 20)
        )
        .onAppear {
            tempPrimaryLanguage = languages[selectedIndex]
        }
    }
}

*/
