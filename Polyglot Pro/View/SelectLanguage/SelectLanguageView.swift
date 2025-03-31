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
    
    var body: some View {
        ZStack {
            
            
            GeometryReader { geometry in
                let itemWidth: CGFloat = 100
                let spacing: CGFloat = 10
                let midX = geometry.size.width / 2
                
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: spacing) {
                            ForEach(languages.indices, id: \..self) { index in
                                VStack(spacing: 0) {
                                    Text(languages[index].flag).font(Font.system(size: 52))
//                                        .overlay( Rectangle() .stroke(Color.red, lineWidth: 1) )
                                    Text(languages[index].displayName).font(.system(size: 14, weight: .bold, design: .rounded))
//                                        .overlay( Rectangle() .stroke(Color.red, lineWidth: 1) )
                                }
//                                    .font(.headline)
                                    .frame(width: 96, height: 90)
//                                    .background(selectedIndex == index ? Color.blue.opacity(0.3) : Color.clear)
                                    .padding(.bottom, 6)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(
                                                LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: 5)
                                            .opacity(selectedIndex == index ? 1.0 : 0.0)
                                    )
                                
                                    .cornerRadius(10)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedIndex = index
                                            onSelect(languages[index])
                                            proxy.scrollTo(index, anchor: .center)
                                        }
                                    }
                            }
                        }
                        .padding(.horizontal, midX - itemWidth / 2)
                    }
                    .onAppear {
                        proxy.scrollTo(selectedIndex, anchor: .center)
                    }
                }
            }
            .frame(height: 100)
//            .overlay( Rectangle() .stroke(Color.red, lineWidth: 1) )
            
            HStack {
                LinearGradient(
                    gradient: Gradient(colors: [.white, .clear]),
                    startPoint: .leading,
                    endPoint: .trailing
                ).frame(width: 80, height: 100)
                
                Spacer()
                
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .white]),
                    startPoint: .leading,
                    endPoint: .trailing
                ).frame(width: 80, height: 100)
            }.allowsHitTesting(false)
        }
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
