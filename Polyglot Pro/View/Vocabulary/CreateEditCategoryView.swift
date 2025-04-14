//
//  CreateEditCategoryView.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-07.
//

import SwiftUI

struct CreateEditCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @State private var categoryName = ""
    @State private var questions: [Question] = []
    @State private var newQuestion = ""
    @State private var newTranslation = ""
    @State private var isAddingQuestion = false
    @State private var currentlyDragging: Question?
    
    var onSave: (() -> Void)?
    
    private let cornerRadius: CGFloat = 12
    private let shadowRadius: CGFloat = 4
    private let textFieldHeight: CGFloat = 50
    
    let backgroundColor: Color = {
#if os(iOS)
        Color(UIColor.systemBackground)
#elseif os(macOS)
        Color(NSColor.windowBackgroundColor)
#endif
    }()
    
    let systemGroupedBackground: Color = {
#if os(iOS)
        Color(UIColor.systemGroupedBackground)
#elseif os(macOS)
        Color(NSColor.windowBackgroundColor)
#endif
    }()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Category Name Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Category Name".localized)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    CustomTextField(
                        text: $categoryName,
                        placeholder: "Enter category name".localized,
                        icon: "tag.fill",
                        backgroundColor: backgroundColor
                    )
                }
                
                // Questions List
                VStack(alignment: .leading, spacing: 8) {
                    Text("Expressions".localized)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    if questions.isEmpty {
                        EmptyStateView()
                    } else {
                        ForEach(questions, id: \.id) { question in
                            QuestionRow(question: question) {
                                if let index = questions.firstIndex(where: { $0.id == question.id }) {
                                    questions.remove(at: index)
                                }
                            }
                            .onDrag {
                                currentlyDragging = question
                                return NSItemProvider(object: question.id.uuidString as NSString)
                            }
                            .onDrop(
                                of: [.text],
                                delegate: QuestionDropDelegate(
                                    question: question,
                                    questions: $questions,
                                    currentlyDragging: $currentlyDragging
                                )
                            )
                        }
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(systemGroupedBackground)
                        .shadow(color: .black.opacity(0.1), radius: shadowRadius)
                )
                
                // Add Question Section
                if isAddingQuestion {
                    VStack(spacing: 16) {
                        CustomTextField(
                            text: $newQuestion,
                            placeholder: "Enter expression".localized,
                            icon: "questionmark.circle.fill",
                            backgroundColor: backgroundColor
                        )
                        
                        CustomTextField(
                            text: $newTranslation,
                            placeholder: "Enter translation".localized,
                            icon: "globe",
                            backgroundColor: backgroundColor
                        )
                        
                        HStack(spacing: 16) {
                            Button(action: resetQuestionForm) {
                                Text("Cancel".localized)
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(SecondaryButtonStyle())
                            
                            Button(action: addQuestionAction) {
                                Text("Add".localized)
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(PrimaryButtonStyle())
                            .disabled(newQuestion.isEmpty || newTranslation.isEmpty)
                        }
                    }
                } else {
                    Button(action: { isAddingQuestion = true }) {
                        Label("Add Expression".localized, systemImage: "plus")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                }
                
                // Save Button
                Button(action: saveCategory) {
                    Text("Save Expression".localized)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(PrimaryButtonStyle())
                .disabled(categoryName.isEmpty || questions.isEmpty)
                .padding(.top, 20)
            }
            .padding(20)
        }
        .customTitle("Create Category".localized)
        .background(systemGroupedBackground.ignoresSafeArea())
    }
    
    private func addQuestionAction() {
        let question = Question(
            id: UUID(),
            expression: newQuestion,
            audioID: nil,
            translations: [Language.english.rawValue: newTranslation],
            examples: []
        )
        questions.append(question)
        resetQuestionForm()
    }
    
    private func resetQuestionForm() {
        newQuestion = ""
        newTranslation = ""
        isAddingQuestion = false
    }
    
    private func saveCategory() {
        guard !categoryName.isEmpty else { return }
        let newCategory = Category.custom(name: categoryName)
        CustomCategoryManager.shared.saveQuestions(questions, for: newCategory)
        CustomCategoryManager.shared.addCustomCategory(name: categoryName, questions: questions)
        onSave?()
        dismiss()
    }
}

struct QuestionDropDelegate: DropDelegate {
    let question: Question
    @Binding var questions: [Question]
    @Binding var currentlyDragging: Question?
    
    func performDrop(info: DropInfo) -> Bool {
        currentlyDragging = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        guard let currentlyDragging = currentlyDragging else { return }
        
        if question.id != currentlyDragging.id {
            let from = questions.firstIndex(where: { $0.id == currentlyDragging.id })!
            let to = questions.firstIndex(where: { $0.id == question.id })!
            
            withAnimation {
                questions.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
            }
        }
    }
}

private struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String
    let icon: String
    let backgroundColor: Color
    
    let systemGray4: Color = {
#if os(iOS)
        Color(UIColor.systemGray4)
#elseif os(macOS)
        Color(NSColor.systemGray)
#endif
    }()
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.secondary)
                .frame(width: 20)
            
            TextField(placeholder, text: $text)
                .textFieldStyle(.plain)
                .font(.system(size: 16, weight: .medium))
                .disableAutocorrection(true)
#if os(iOS)
                .textInputAutocapitalization(.never)
#endif
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(backgroundColor)
                .shadow(color: .black.opacity(0.1), radius: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(systemGray4, lineWidth: 1)
        )
    }
}

private struct QuestionRow: View {
    let question: Question
    @State private var offset: CGFloat = 0
    @State private var initialOffset: CGFloat = 0
    @State private var isSwiped: Bool = false
    
    var onDelete: (() -> Void)?
    
    let backgroundColor: Color = {
#if os(iOS)
        Color(UIColor.systemBackground)
#elseif os(macOS)
        Color(NSColor.windowBackgroundColor)
#endif
    }()
    
    var body: some View {
        ZStack(alignment: .trailing) {
            // Delete button (background)
            Button(action: {
                withAnimation {
                    onDelete?()
                }
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                    .frame(width: 80, height: 70)
                    .background(Color.red)
                    .cornerRadius(8)
                    .clipped()
            }
            .zIndex(0)
            
            // Content (foreground)
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(question.expression)
                        .font(.headline)
                    
                    if let translation = question.translations.first?.value {
                        Text(translation)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(.gray)
                    .font(.system(size: 22))
                    .cornerRadius(8)
                    .clipped()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(backgroundColor)
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
            .frame(height: 70)
            .cornerRadius(8)
            .clipped()
            
            .offset(x: offset)
            .zIndex(1)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { gesture in
                        if gesture.translation.width < 0 {
                            offset = gesture.translation.width
                        }
                    }
                    .onEnded { gesture in
                        if gesture.translation.width < -80 {
                            withAnimation {
                                offset = -88
                                isSwiped = true
                            }
                        } else {
                            withAnimation {
                                offset = 0
                                isSwiped = false
                            }
                        }
                    }
            )

        }
        
    }
}
private struct EmptyStateView: View {
    var body: some View {
        VStack {
            Image(systemName: "questionmark.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Text("No Expressions Added")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(40)
    }
}

private struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(
                LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing)
                .cornerRadius(12)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

private struct SecondaryButtonStyle: ButtonStyle {
    
    let systemGray4: Color = {
#if os(iOS)
        Color(UIColor.systemGray4)
#elseif os(macOS)
        Color(NSColor.systemGray)
#endif
    }()
    
    let secondarySystemBackground: Color = {
#if os(iOS)
Color(UIColor.secondarySystemBackground)
#elseif os(macOS)
Color(NSColor.windowBackgroundColor) // or a better macOS-specific fallback
#endif
    }()
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.primary)
            .padding()
            .background(
                secondarySystemBackground
                    .cornerRadius(12)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(systemGray4, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
