//
//  ExamplesView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI

struct ExamplesView: View {
    let examples: [(String, String)]
    @ObservedObject var viewModel: LearnViewModel
    
    let minWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 1000
        default: return 400
        }
    }()
    
    let minHeight: CGFloat = {
        switch Platform.current {
        case .macOS: return 230
        default: return 0
        }
    }()
    
    let titleFontSize: CGFloat = {
        switch Platform.current {
        case .macOS: return 26
        default: return 20
        }
    }()
    
    let fontSize: CGFloat = {
        switch Platform.current {
        case .macOS: return 26
        default: return 16
        }
    }()
    
    let lineWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 5
        default: return 3
        }
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            ForEach(viewModel.questions[viewModel.currentIndex].examples, id: \ .swedish) { example in
                HStack {
                    Button(action: {
                        viewModel.speak(text: example.swedish)
                    }) {
                        Image(systemName: "speaker.wave.2.fill")
                            .frame(width: 50, height: 25)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(6)
                            
                    }.buttonStyle(ScaleButtonStyle())
                    
                    if Platform.current == .macOS {
                        Text(example.swedish)
                            .font(.system(size: fontSize))
                        Spacer()
                        Text(example.ukrainian)
                            .font(.system(size: fontSize))
                            .foregroundColor(.gray)
                    } else {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(example.swedish)
                                .font(.system(size: fontSize))
                            Text(example.ukrainian)
                                .font(.system(size: fontSize))
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
        .padding(20)
        .background(.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(
                    LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: lineWidth)
                .shadow(color: .purple.opacity(0.5), radius: 10)
        )
        .padding(20)
    }
}

/*struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExamplesView(examples: [("Hej", "Привіт")], viewModel: LearnViewModel(category: QuestionCategory.weekdays))
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            ExamplesView(examples: [("Hej", "Привіт")], viewModel: LearnViewModel(category: QuestionCategory.weekdays))
                .frame(minWidth: 1000, minHeight: 230)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("macOS")
        }
    }
}
*/
