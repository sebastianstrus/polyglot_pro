//
//  AlphabetView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-23.
//

import SwiftUI
import Combine

struct AlphabetView: View {
    
    @EnvironmentObject var settings: SettingsManager
    
    @StateObject var viewModel: AlphabetViewModel
    
    @State private var cancellables = Set<AnyCancellable>()
    
    
    @State private var toast: Toast? = nil
    
    let size: CGFloat = {
        switch Platform.current {
        case .macOS: return 100
        case .iPadOS: return 100
        default: return 56
        }
    }()
    
    let fontSize: CGFloat = {
        switch Platform.current {
        case .macOS: return 40
        case .iPadOS: return 40
        default: return 22
        }
    }()
    
    let cornerRadius: CGFloat = {
        switch Platform.current {
        case .macOS: return 12
        default: return 6
        }
    }()
    
    let paddingTop: CGFloat = {
        switch Platform.current {
        case .macOS: return 40
        default: return 20
        }
    }()
    
    let columns: [GridItem] = {
        let count: Int
        switch Platform.current {
        case .iOS: count = 4
        case .iPadOS: count = 5
        case .macOS: count = 6
        case .unknown: count = 4
        }
        
        return Array(repeating: GridItem(.flexible(), spacing: 0), count: count)
    }()

    var body: some View {
        ScrollView {
            
            Text("").frame(height: paddingTop)
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.letters, id: \.self) { letterPair in
                    Button(action: {
                        

//                        toast = Toast(style: .info, message: "Your device muted!")
                        viewModel.speakLetter(letterPair)
                        
                        
                    }) {
                        Text(letterPair)
                            .frame(width: size, height: size)
                            .font(.system(size: fontSize, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .cornerRadius(10)
                    }
                    .buttonStyle(ScaleButtonStyle())
                }
            }
            .padding()
        }
        .customTitle("Alphabet")
        .onAppear {
            viewModel.mutedPublisher
                .receive(on: RunLoop.main)
                .sink {
                    toast = Toast(style: .info, message: "Your device is muted!")
                }
                .store(in: &cancellables)
        }
        .toastView(toast: $toast)

        
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(GradientBackground().ignoresSafeArea())
    }
}
