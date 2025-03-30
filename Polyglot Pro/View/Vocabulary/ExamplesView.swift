//
//  ExamplesView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-09.
//

import SwiftUI

struct ExamplesView: View {
    let examples: [Example]
    
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
    
    let insidePadding: CGFloat = {
        switch Platform.current {
        case .macOS: return 20
        default: return 10
        }
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(viewModel.questions[viewModel.currentIndex].examples, id: \.sentence) { example in
                ExampleRowView(viewModel: viewModel, example: example, fontSize: fontSize)
            }
        }
        .padding(insidePadding)
        .background(viewModel.settings.isDarkMode ? .clear : .white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(
                    LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: lineWidth)
                .shadow(color: .purple.opacity(0.5), radius: 10)
        ).padding(.horizontal, 20)
    }
}

struct ExampleRowView: View {
    
    @ObservedObject var viewModel: LearnViewModel
    
    let example: Example
    let fontSize: CGFloat
    
    var body: some View {
        
        let text = (example.translations.first(where: { $0.language == viewModel.settings.primaryLanguage }))!.text
        
        return HStack() {
            Button(action: {
                let text: String = example.sentence.text
                viewModel.speak(text: text)
            }) {
                Image(systemName: "speaker.wave.2.fill")
                    .frame(width: 25, height: 25)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(6)
            }
            .buttonStyle(ScaleButtonStyle())
            
            if Platform.current == .macOS {
                Text(example.sentence.text)
                    .font(.system(size: fontSize))
                
                Spacer()
                
                Text(text)
                    .font(.system(size: fontSize))
                    .foregroundColor(.gray)
            } else {
                VStack(alignment: .leading, spacing: 0) {
                    Text(example.sentence.text)
                        .font(.system(size: fontSize))
                        .fixedSize(horizontal: false, vertical: true)
                    Text(text)
                        .font(.system(size: fontSize))
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                Spacer()
            }
        }
    }
}
/*struct ExamplesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExamplesView(examples: [("Hej", "Привіт")], viewModel: LearnViewModel(category: Category.weekdays))
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            ExamplesView(examples: [("Hej", "Привіт")], viewModel: LearnViewModel(category: Category.weekdays))
                .frame(minWidth: 1000, minHeight: 230)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("macOS")
        }
    }
}
*/
