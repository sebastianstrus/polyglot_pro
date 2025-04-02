//
//  View+Extensions.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI
import SwiftUI
import UIKit
import MessageUI

enum ButtonType {
    case primary
    case secondary
    case empty
}

extension View {
    
    func styledTitel() -> some View {
        let size: CGFloat = {
            switch Platform.current {
            case .macOS:
                return 42
            case .iPadOS:
                return 42
            case .iOS:
                return 24
            case .unknown:
                return 30
            }
        }()
        
        return self
            .font(.system(size: size, weight: .bold, design: .rounded))
            .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
        
    }
    
    func styledSubtitel() -> some View {
        let size: CGFloat = {
            switch Platform.current {
            case .macOS:
                return 26
            case .iPadOS:
                return 26
            case .iOS:
                return 16
            case .unknown:
                return 20
            }
        }()
        
        return self
            .font(.system(size: size, weight: .bold, design: .rounded))
            .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing))
        
    }
    
    func styledText(color: Color) -> some View {
        
        let size: CGFloat = {
            switch Platform.current {
            case .macOS:
                return 22
            case .iPadOS:
                return 22
            case .iOS:
                return 17
            case .unknown:
                return 15
            }
        }()
        
        return self
            .font(.system(size: size, weight: .bold, design: .rounded))
            .foregroundColor(color)
    }
    
    func styledButton(_ type: ButtonType = .primary, isIcon: Bool = false) -> some View {
        let size: CGFloat
        let width: CGFloat
        let height: CGFloat
        let radius: CGFloat
        
        switch Platform.current {
        case .macOS:
            size = 20
            width = type == .primary ? 100 : 300
            height = 50
            radius = 12
        case .iPadOS:
            size = 20
            width = type == .primary ? 100 : 300
            height = 50
            radius = 12
        case .iOS:
            size = isIcon ? 20 : 16
            width = type == .primary ? 88 : 150
            height = 44
            radius = 6
        case .unknown:
            size = isIcon ? 20 : 16
            width = type == .primary ? 88 : 150
            height = 44
            radius = 6
        }
        
        return self
            .font(.system(size: size, weight: .bold))
            .frame(width: isIcon ? height : width, height: height)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .foregroundColor(.white)
            .cornerRadius(radius)
            .shadow(color: Color.blue.opacity(0.4), radius: radius, x: 0, y: 5)
    }
    
    func styledTextField(isCorrect: Bool?, shake: Bool, isTranstarent: Bool = false) -> some View {
        let size: CGFloat
        let width: CGFloat
        let height: CGFloat
        let radius: CGFloat
        let lineWidth: CGFloat
        
        switch Platform.current {
        case .macOS:
            size = 30
            width = 460
            height = 70
            radius = 20
            lineWidth = 5
        case .iPadOS:
            size = 30
            width = 440
            height = 70
            radius = 20
            lineWidth = 5
        case .iOS:
            size = 20
            width = 300
            height = 50
            radius = 6
            lineWidth = 3
        case .unknown:
            size = 20
            width = 300
            height = 50
            radius = 6
            lineWidth = 3
        }
        
        return self
            .foregroundColor(isCorrect == nil ? Color.gray : (isCorrect! ? Color.green : Color.red))
            .font(.system(size: size, weight: .bold, design: .rounded))
            .frame(width: width, height: height)
            .background(Color.white.opacity(isTranstarent ? 0 : 1))
            .cornerRadius(radius)
            .allowsHitTesting(!(isCorrect ?? false))
            .disableAutocorrection(true)
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(
                        LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: lineWidth)
                    .shadow(color: .purple.opacity(0.5), radius: 10)
            )
            .multilineTextAlignment(.center)
            .textFieldStyle(.plain)
            .modifier(ShakeEffect(animatableData: CGFloat(shake ? 1 : 0)))
    }
    
    func styledSlider() -> some View {
        
        return self
        
            .frame(width: 100, height: 50)
            .cornerRadius(12)
        
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(.white))
                    .frame(width: 100, height: 4)
                    .allowsHitTesting(false)
                
            )
        
            .overlay(
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 2, height: 8)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 2, height: 8)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(Color(.white))
                        .frame(width: 2, height: 8)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(Color(.white))
                        .frame(width: 2, height: 8)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(Color(.white))
                        .frame(width: 2, height: 8)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(Color(.white))
                        .frame(width: 2, height: 8)
                    
                }.allowsHitTesting(false)
                    .frame(width: 94)
            )
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)
                    .frame(height: 50)
                    .cornerRadius(12)
            )
            .cornerRadius(12)
            .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
            .accentColor(Color(.white))
    }
    
    func customTitle(_ title: String) -> some View {
        self.modifier(NavigationTitleModifier(title: title))
    }
    
}


extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(ShakeDetector(action: action))
    }
}


