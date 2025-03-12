//
//  View+Extensions.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI

extension View {
    func styledButton() -> some View {
        self
            .font(.title)
            .frame(width: 100, height: 50)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .foregroundColor(.white)
            .cornerRadius(12)
            .shadow(color: Color.blue.opacity(0.4), radius: 10, x: 0, y: 5)
            .padding()
            .buttonStyle(ScaleButtonStyle())
    }
    
    func styledTextField(isCorrect: Bool?, shake: Bool) -> some View {
        self
            .foregroundColor(isCorrect == nil ? Color.gray : (isCorrect! ? Color.green : Color.red))
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .frame(width: 600, height: 70)
            .background(Color.white)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: 5)
                    .shadow(color: .purple.opacity(0.5), radius: 10)
            )
            .multilineTextAlignment(.center)
            .textFieldStyle(.plain)
            .modifier(ShakeEffect(animatableData: CGFloat(shake ? 1 : 0)))
    }
    
    func styledSlider() -> some View {
        self
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
                    ForEach(0..<6, id: \.self) { _ in
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 2, height: 8)
                        Spacer()
                    }
                }
                .allowsHitTesting(false)
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
}
