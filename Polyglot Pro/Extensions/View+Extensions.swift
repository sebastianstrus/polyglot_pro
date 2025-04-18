//
//  View+Extensions.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI
import SwiftUI
#if os(iOS)
import MessageUI
import UIKit
#endif

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
            radius = 12
        case .unknown:
            size = isIcon ? 20 : 16
            width = type == .primary ? 88 : 150
            height = 44
            radius = 12
        }
        
        return self
            .font(.system(size: size, weight: .bold))
            .frame(width: isIcon ? height : width, height: height)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .foregroundColor(.white)
            .cornerRadius(radius)
//            .shadow(color: Color.blue.opacity(0.4), radius: radius, x: 0, y: 5)
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


#if os(iOS)
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(ShakeDetector(action: action))
    }
}
#endif


extension View {

  func toastView(toast: Binding<Toast?>) -> some View {
    self.modifier(ToastModifier(toast: toast))
  }
}


extension View {
    /// Adds a shimmering shine effect to any View.
    /// - Parameters:
    ///   - toggle: Controls the animation trigger.
    ///   - duration: The duration of the shine animation.
    ///   - clipShape: The shape to clip the shine effect within.
    ///   - rightToLeft: Flips direction of the shine (right-to-left if true).
    @ViewBuilder
    func shine(
        _ toggle: Bool,
        duration: CGFloat = 0.5,
        clipShape: some Shape = Rectangle(),
        rightToLeft: Bool = false
    ) -> some View {
        self.overlay {
            GeometryReader { geometry in
                let size = geometry.size
                let moddedDuration = max(0.3, duration) // Prevent negative/too short durations

                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [
                                .clear,
                                .clear,
                                .white.opacity(0.1),
                                .white.opacity(0.5),
                                .white.opacity(1),
                                .white.opacity(0.5),
                                .white.opacity(0.1),
                                .clear,
                                .clear
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .scaleEffect(y: 8) // Stretch vertically
                    .keyframeAnimator(initialValue: 0.0, trigger: toggle) { content, progress in
                        content
                            .offset(x: -size.width + progress * (size.width * 2))
                    } keyframes: { _ in
                        CubicKeyframe(0.0, duration: 0.1)
                        CubicKeyframe(1.0, duration: moddedDuration)
                    }
                    .rotationEffect(.degrees(45)) // Angle of the shine sweep
                    .scaleEffect(x: rightToLeft ? -1 : 1) // Flip for right-to-left animation
            }
            .clipShape(clipShape)
        }
    }
}
