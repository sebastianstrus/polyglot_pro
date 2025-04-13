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
    
    var onSave: (() -> Void)?
    
    private let cornerRadius: CGFloat = 12
    private let shadowRadius: CGFloat = 4
    private let textFieldHeight: CGFloat = 50
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Category Name Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Category Name".localized)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    CustomTextField2(
                        text: $categoryName,
                        placeholder: "Enter category name".localized,
                        icon: "tag.fill",
                        backgroundColor: Color(.systemBackground)
                    )
                }
                
                // Questions List
                VStack(alignment: .leading, spacing: 8) {
                    Text("Questions".localized)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    if questions.isEmpty {
                        EmptyStateView()
                    } else {
                        ForEach(questions, id: \.id) { question in
                            QuestionRow(question: question, onDelete: {
                                if let index = questions.firstIndex(where: { $0.id == question.id }) {
                                    withAnimation {
                                        _ = questions.remove(at: index)
                                    }
                                }
                            })
                            .contextMenu {
                                Button(role: .destructive) {
                                    if let index = questions.firstIndex(where: { $0.id == question.id }) {
                                        questions.remove(at: index)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color(.secondarySystemBackground))
                        .shadow(color: .black.opacity(0.1), radius: shadowRadius)
                )
                
                // Add Question Section
                if isAddingQuestion {
                    VStack(spacing: 16) {
                        CustomTextField2(
                            text: $newQuestion,
                            placeholder: "Enter question".localized,
                            icon: "questionmark.circle.fill",
                            backgroundColor: Color(.systemBackground)
                        )
                        
                        CustomTextField2(
                            text: $newTranslation,
                            placeholder: "Enter translation".localized,
                            icon: "globe",
                            backgroundColor: Color(.systemBackground)
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
                        Label("Add Question".localized, systemImage: "plus")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                }
                
                // Save Button
                Button(action: saveCategory) {
                    Text("Save Category".localized)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(PrimaryButtonStyle())
                .disabled(categoryName.isEmpty || questions.isEmpty)
                .padding(.top, 20)
            }
            .padding(20)
        }
        .customTitle("Create Category".localized)
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
    
    // MARK: - Private Methods
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

// MARK: - Custom Components
private struct CustomTextField2: View {
    @Binding var text: String
    let placeholder: String
    let icon: String
    let backgroundColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.secondary)
                .frame(width: 20)
            
            TextField(placeholder, text: $text)
                .textFieldStyle(.plain)
                .font(.system(size: 16, weight: .medium))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(backgroundColor)
                .shadow(color: .black.opacity(0.1), radius: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
    }
}

private struct QuestionRow: View {
    let question: Question
    var onDelete: (() -> Void)? // Add delete callback
    
    var body: some View {
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
            
            // Add delete button
            Button(action: {
                onDelete?()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemBackground))
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

private struct EmptyStateView: View {
    var body: some View {
        VStack {
            Image(systemName: "questionmark.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
            
            Text("No Questions Added")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(40)
    }
}

// MARK: - Button Styles
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
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.primary)
            .padding()
            .background(
                Color(.secondarySystemBackground)
                    .cornerRadius(12)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
