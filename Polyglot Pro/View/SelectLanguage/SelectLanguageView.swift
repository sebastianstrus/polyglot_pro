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
    @State private var tempTargetLanguage: Language? = .swedish // Default
    
    @State private var isSameLanguage: Bool = false
    
    @State private var scrollPrimaryOffset: CGFloat = 0
    @State private var selectedPrimaryIndex: Int = 0
    
    @State private var scrollTargetOffset: CGFloat = 0
    @State private var selectedTargetIndex: Int = 0
    
    let languages = Language.allCases
    
    let width: CGFloat = {
        switch Platform.current {
        case .macOS: return 380
        case .iPadOS: return 300
        default: return 300
        }
    }()
    
    let height: CGFloat = {
        switch Platform.current {
        case .macOS: return 580
        case .iPadOS: return 480
        default: return 480
        }
    }()
    
    var body: some View {
        VStack {
            Spacer()
            
//            Text("Select primary language:")
//                .font(.system(size: 16, weight: .bold, design: .rounded))
//                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
//            
//            LanguageScrollView(selectedIndex: $selectedPrimaryIndex, languages: languages) { language in
//                tempPrimaryLanguage = language
//            }
//            
//            Spacer()
            
            Text("Select target language:")
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
            LanguageScrollView(selectedIndex: $selectedTargetIndex, languages: languages) { language in
                tempTargetLanguage = language
            }
            
            Spacer()
            
//            Text("The languages must be different.")
//                .font(.system(size: 12))
//                .foregroundColor(.red)
//                .opacity(isSameLanguage ? 1 : 0)
            
            NavigationLink(value: Destination.main) {
                Text("Continue".localized)
                    .styledButton(.secondary)
            }
            .buttonStyle(ScaleButtonStyle())
            .onTapGesture {
//                guard tempPrimaryLanguage != tempTargetLanguage else {
//                    isSameLanguage = true
//                    return
//                }
                if tempTargetLanguage == .swedish {
                    settings.targetLanguage = tempTargetLanguage
                }
                
            }
            
            Spacer()
        }
        .padding()
        .frame(width: width, height: height, alignment: .center)
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
    @Environment(\.layoutDirection) var layoutDirection
    
    @Binding var selectedIndex: Int
    let languages: [Language]
    let onSelect: (Language) -> Void
    
    @State private var scrollOffset: CGFloat = 0
    @State private var scrollViewWidth: CGFloat = 0
    @State private var isDragging = false
    @State private var proxy: ScrollViewProxy? = nil
    @State private var visibleItems: [Int: CGRect] = [:]
    @State private var closestIndex: Int = 0
    
    // Timer to detect when scrolling stops
    @State private var scrollEndTimer: Timer? = nil
    
    @State private var startTime = Date.now

    let gradientWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 120
        case .iPadOS: return 120
        case .iOS: return 80
        default: return 80
        }
    }()

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let itemWidth: CGFloat = 120
                let spacing: CGFloat = 10
                let midX = geometry.size.width / 2
                
                ScrollViewReader { scrollProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: spacing) {
                            ForEach(languages.indices, id: \.self) { index in
                                VStack(spacing: 0) {
                                    // Only apply the effect to the selected item
                                    if shouldShowEffect(for: index) {
                                        TimelineView(.animation) { timeline in
                                            let elapsedTime = startTime.distance(to: timeline.date)

                                            Text(languages[index].flag).font(Font.system(size: 52))
                                                .drawingGroup()
                                                .visualEffect { content, proxy in
                                                    content
                                                        .distortionEffect(
                                                            ShaderLibrary.relativeWave(
                                                                .float2(proxy.size),
                                                                .float(elapsedTime),
                                                                .float(8),
                                                                .float(20),
                                                                .float(2)
                                                            ),
                                                            maxSampleOffset: .zero
                                                        )
                                                }
                                        }
                                    } else {
                                        // Regular flag without effect
                                        Text(languages[index].flag).font(Font.system(size: 52))
                                    }
                                    
                                    Text(languages[index].nativeName).font(.system(size: 12, weight: .bold, design: .rounded))
                                        .lineLimit(2)
                                        .multilineTextAlignment(.center)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .frame(width: 94)
                                    
                                    Text(languages[index].displayName).font(.system(size: 12, weight: .bold, design: .rounded))
                                        .foregroundColor(.gray)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.center)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding(.top, 2)
                                        .frame(width: 114)
                                }
                                .frame(width: itemWidth, height: 110)
                                .padding(.bottom, 6)
                                .background(Color.white)
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
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                            selectAndCenter(index: selectedIndex, proxy: scrollProxy)
                                        }
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
                        handleScrollChange()
                    }
                }
            }
            .frame(height: 120)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { _ in
                        isDragging = true
                        scrollEndTimer?.invalidate()
                    }
                    .onEnded { _ in
                        isDragging = false
                        scheduleScrollEndDetection()
                    }
            )
            
            // Gradient overlays
            HStack {
                LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .leading, endPoint: .trailing)
                    .frame(width: gradientWidth, height: 120)
                    .scaleEffect(x: layoutDirection == .rightToLeft ? -1 : 1, y: 1)
                
                Spacer()
                
                LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .leading, endPoint: .trailing)
                    .frame(width: 80, height: 120)
                    .scaleEffect(x: layoutDirection == .rightToLeft ? -1 : 1, y: 1)
            }
            .allowsHitTesting(false)
        }
    }
    
    private func shouldShowEffect(for index: Int) -> Bool {
        return (isDragging || scrollEndTimer != nil) ? (closestIndex == index) : (selectedIndex == index)
    }
    
    private func shouldShowBorder(for index: Int) -> Bool {
        return shouldShowEffect(for: index)
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
        
        if newClosestIndex != closestIndex {
            closestIndex = newClosestIndex
        }
    }
    
    private func handleScrollChange() {
        scrollEndTimer?.invalidate()
        
        if !isDragging {
            scheduleScrollEndDetection()
        }
    }
    
    private func scheduleScrollEndDetection() {
        scrollEndTimer?.invalidate()
        scrollEndTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
            DispatchQueue.main.async {
                self.scrollEnded()
            }
        }
    }
    
    private func scrollEnded() {
        guard let proxy = proxy else { return }
        selectAndCenter(index: closestIndex, proxy: proxy)
        scrollEndTimer = nil
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

