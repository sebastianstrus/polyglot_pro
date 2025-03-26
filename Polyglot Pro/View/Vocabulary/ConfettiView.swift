//
//  ConfettiView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-20.
//

import SwiftUI

struct ConfettiParticle: View {
    let color: Color
    let size: CGFloat
    var position: CGPoint
    let rotation: Angle
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
            .position(position)
            .rotationEffect(rotation)
    }
}

struct ConfettiView: View {
    @State private var particles: [ConfettiParticle] = []
    
    let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple]
    let particleCount = 100
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(particles.indices, id: \.self) { index in
                    particles[index]
                }
            }
            .onAppear {
                startConfetti(in: geometry.size)
            }
        }
    }
    
    func startConfetti(in size: CGSize) {
        for _ in 0..<particleCount {
            let color = colors.randomElement()!
            let particleSize = CGFloat.random(in: 5...15)
            let position = CGPoint(x: CGFloat.random(in: 0...size.width),
                                  y: CGFloat.random(in: 0...size.height))
            let rotation = Angle(degrees: Double.random(in: 0...360))
            
            let particle = ConfettiParticle(color: color, size: particleSize, position: position, rotation: rotation)
            particles.append(particle)
        }
        
        withAnimation(Animation.linear(duration: 5).repeatForever(autoreverses: false)) {
            for index in particles.indices {
                particles[index].position.y += size.height
            }
        }
    }
}
