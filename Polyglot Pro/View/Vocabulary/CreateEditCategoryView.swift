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
    
    let lineWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 5
        default: return 3
        }
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Spacer()
            
            TextField("Enter category name".localized, text: $categoryName)
            
            Spacer()
            
            VStack {
                Text("Questions".localized)
                // Questions list
                ForEach(questions, id: \.id) { question in
                    VStack(alignment: .leading) {
                        Text(question.expression)
                            .font(.headline)
                        Text(question.translations.first!.value)
                            .font(.subheadline)
                    }
                }
                .onDelete(perform: deleteQuestion)
            }.overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        LinearGradient(colors: [.blue, .purple], startPoint: .leading, endPoint: .trailing), lineWidth: lineWidth)
                    .shadow(color: .purple.opacity(0.5), radius: 10)
            )
            
            Spacer()
            // Add Question section
            if isAddingQuestion {
                TextField("Enter question".localized, text: $newQuestion)
                TextField("Enter translation".localized, text: $newTranslation)
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        resetQuestionForm()
                    }) {
                        Text("Cancel".localized)
                            .styledButton(.secondary)
                    }.buttonStyle(ScaleButtonStyle())

                    
                    Spacer()
                    
                    Button(action: {
                        let newQ = newQuestion // Capture values before reset
                        let newT = newTranslation
                        DispatchQueue.main.async {
                            addQuestion(question: newQ, translation: newT)
                        }
                    }) {
                        Text("Add".localized)
                            .styledButton(.secondary)
                    }.buttonStyle(ScaleButtonStyle())
                        .opacity(newQuestion.isEmpty || newTranslation.isEmpty ? 0.5 : 1.0)
                        .disabled(newQuestion.isEmpty || newTranslation.isEmpty)
                    
                    Spacer()

                }
                
            } else {
                
                
                Button(action: {
                    isAddingQuestion = true
                }) {
                    Text("Add Question".localized)
                        .styledButton(.secondary)
                }.buttonStyle(ScaleButtonStyle())

                

            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button(action: {
                    saveCategory()
                }) {
                    Text("Save Category".localized)
                        .styledButton(.secondary)
                }.buttonStyle(ScaleButtonStyle())
                    .opacity(categoryName.isEmpty || questions.isEmpty ? 0.5 : 1.0)
                    .disabled(categoryName.isEmpty || questions.isEmpty)
                
                Spacer()
                
            }
            
            
            
            Spacer()
            
//            Button("Save Category".localized) {
//                saveCategory()
//            }
//            .disabled(categoryName.isEmpty || questions.isEmpty)
        }
        .padding(20)
        .customTitle("Create Category".localized)
    }
    
    
    
    
    private func addQuestion(question: String, translation: String) {
        let translationDict = [Language.english.rawValue: translation]
        let newQuestion = Question(
            id: UUID(),
            expression: question,
            audioID: nil,
            translations: translationDict,
            examples: []
        )
        
        print("Adding question: \(newQuestion)")
        questions.append(newQuestion)
        resetQuestionForm()
    }
    
    private func resetQuestionForm() {
        newQuestion = ""
        newTranslation = ""
        isAddingQuestion = false
    }
    
    private func deleteQuestion(at offsets: IndexSet) {
        questions.remove(atOffsets: offsets)
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
