//
//  LearnView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI

struct LearnView: View {
    @ObservedObject var viewModel: LearnViewModel
    @Binding var showMenu: Bool
    @State var showWords = true
    
    private var columns: [GridItem] {
        switch Platform.current {
        case .macOS:
            let allCount = viewModel.questions.count
            let count = (10...16).contains(allCount) ? 2 : max(1, Int(ceil(Double(allCount) / 16)))
            return Array(repeating: GridItem(.flexible(), spacing: 10), count: count)
        default:
            return [GridItem(.flexible())]
        }
    }
    
    var body: some View {
        ZStack {
            gradientBackground
                .ignoresSafeArea()
            
            if showWords {
                VStack {
                    ZStack {
                        HStack {
                            backButton
                            Spacer()
                        }
                        
                        categoryTitle
                    }
                    
                    
                    Text("Försök att komma ihåg \(viewModel.questions.count) uttrycken.")
                        .styledSubtitel()
                    
                    Spacer()
                    
                    wordGrid
                    
                    Spacer()
                    
                    HStack {
                        startButton
                    }
                    .padding(.bottom, Platform.current == .macOS ? 80 : 30)
                    .padding(.top, Platform.current == .macOS ? 0 : 8)
                }
            } else {
                QuizView(viewModel: viewModel, showMenu: $showMenu)
            }
        }
    }
    
    private var gradientBackground: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.cyan.opacity(0.2), Color.blue.opacity(0.5)]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    private var backButton: some View {
        Button(action: {
            showWords = false
            showMenu = true
        }) {
            Image(systemName: "chevron.left")
                .styledButton(isIcon: true)
                .padding()
                .padding(.top, 16)
        }.buttonStyle(ScaleButtonStyle())
    }
    
    private var categoryTitle: some View {
        Text(viewModel.category.rawValue)
            .styledTitel()
            .padding(.top, 40)
            .padding(.bottom, 6)
    }
    
    private var startButton: some View {
        Button(action: {
            showWords = false
        }) {
            Text("Start")
                .styledButton()
        }.buttonStyle(ScaleButtonStyle())
    }
    
    private var wordGrid: some View {
        VStack(alignment: .center) {
            ScrollView {
                
                ZStack {
                    Spacer().containerRelativeFrame([.vertical])
                    
                    VStack {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                            ForEach(viewModel.questionsBase, id: \.expression) { question in
                                HStack(alignment: .center) {
                                    Text(question.translation)
                                        .styledText(color: .blue)
                                    Text("–")
                                        .styledText(color: .gray)
                                    Text(question.expression)
                                        .styledText(color: .purple)
                                }
                                .padding(.horizontal)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }.scrollBounceBehavior(.basedOnSize)
        }
        .frame(maxWidth: .infinity)
    }
}

import SwiftUI

struct ConfettiParticle: View {
    let color: Color
    let size: CGFloat
    var position: CGPoint
    let rotation: Angle
    
    var body: some View {
        Circle() // Use Circle instead of Rectangle
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
