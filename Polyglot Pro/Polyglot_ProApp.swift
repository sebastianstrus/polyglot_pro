//
//  Polyglot_ProApp.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-16.
//

import SwiftUI

@main
struct Polyglot_ProApp: App {
    
    @StateObject private var settings = SettingsManager.shared
    
    let minWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 1350
        default: return 100
        }
    }()
    
    let minHeight: CGFloat = {
        switch Platform.current {
        case .macOS: return 800
        default: return 100
        }
    }()
    
    
    init() {
#if os(macOS)
        Task {
            NSApp.appearance = NSAppearance(named: .aqua)
        }
#endif
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(settings)
                .frame(minWidth: minWidth, maxWidth: .infinity, minHeight: minHeight, maxHeight: .infinity)
                .preferredColorScheme(settings.isDarkMode ? .dark : .light)
        }
    }
}

/* upload: sv_adjectives_colors.json
Hej. Tworzę aplikację do nauki języka szwedzkiego dla osób, które już znają inne języki. Potrzebuję więcej wyrazen z tłumaczeniami. Do każdego wyrazenia 4 przykłady zdań, które też są przetłumaczone. Potrzebuję te wyrazenia w formacie json. Wysyłam Ci plik json z przykładową inną kategorią i proszę stwórz nowy plik z poniższymi wyrazeniami. Wykorzystaj koniecznie wszystkie poniżej. Użyj wszystkie słowa. Aż do końca.

nyligen, idag, i morse, i kväll, i natt, om en stund, hädanefter, hittills, då och då, någon gång
*/




struct SwipeActionExample: View {
    let items = ["Apple", "Banana", "Cherry"]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(items, id: \.self) { item in
                    CustomSwipeRow(item: item)
                }
            }
        }
    }
}

struct CustomSwipeRow: View {
    let item: String
    @State private var offset: CGFloat = 0.0
    @GestureState private var isDragging = false

    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Spacer()
                Button(action: {
                    print("Deleted \(item)")
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(8)
                }
                .padding(.trailing, 16)
            }

            Text(item)
                .frame(maxWidth: .infinity, minHeight: 60, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .offset(x: offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.width < 0 {
                                offset = max(value.translation.width, -80)
                            }
                        }
                        .onEnded { value in
                            if value.translation.width < -40 {
                                offset = -80
                            } else {
                                offset = 0
                            }
                        }
                )
                .animation(.easeInOut, value: offset)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}



