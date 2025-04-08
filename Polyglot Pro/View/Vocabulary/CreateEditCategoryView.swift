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
    @State private var showingAddQuestion = false
    @State private var newQuestion = ""
    @State private var newTranslation = ""
    
    var body: some View {
        Form {
            Section(header: Text("Category Name".localized)) {
                TextField("Enter category name".localized, text: $categoryName)
            }
            
            Section(header: Text("Questions".localized)) {
                ForEach(questions, id: \.id) { question in
                    VStack(alignment: .leading) {
                        Text(question.expression)
                            .font(.headline)
                        ForEach(Array(question.translations.keys), id: \.self) { key in
                            HStack {
                                Text("\(key):")
                                    .font(.subheadline)
                                Text(question.translations[key] ?? "")
                            }
                        }
                    }
                }
                .onDelete(perform: deleteQuestion)
                
                Button(action: {
                    showingAddQuestion = true
                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add Question".localized)
                    }
                }
            }
            
            Section {
                Button("Save Category".localized) {
                    saveCategory()
                }
                .disabled(categoryName.isEmpty || questions.isEmpty)
            }
        }
        .navigationTitle("New Category".localized)
        .sheet(isPresented: $showingAddQuestion) {
            NavigationView {
                Form {
                    Section(header: Text("Question".localized)) {
                        TextField("Enter question".localized, text: $newQuestion)
                    }
                    
                    Section(header: Text("Translation".localized)) {
                        TextField("Enter translation".localized, text: $newTranslation)
                    }
                    
                    Button("Add".localized) {
                        let translation = [Language.english.rawValue: newTranslation] // Adjust based on your needs
                        let question = Question(id: UUID(),
                                              expression: newQuestion,
                                              audioID: nil,
                                              translations: translation,
                                              examples: [])
                        questions.append(question)
                        newQuestion = ""
                        newTranslation = ""
                        showingAddQuestion = false
                    }
                    .disabled(newQuestion.isEmpty || newTranslation.isEmpty)
                }
                .navigationTitle("New Question".localized)
                .navigationBarItems(trailing: Button("Cancel".localized) {
                    showingAddQuestion = false
                })
            }
        }
    }
    
    private func deleteQuestion(at offsets: IndexSet) {
        questions.remove(atOffsets: offsets)
    }
    
//    private func saveCategory() {
//        print("TEST100 saveCategory")
//        CustomCategoryManager.shared.addCustomCategory(name: categoryName, questions: questions)
//        dismiss()
//    }
    private func saveCategory() {
        guard !categoryName.isEmpty else { return }
        
        // Create a new custom category
        let newCategory = Category.custom(name: categoryName)
        
        // Save the questions to UserDefaults
        CustomCategoryManager.shared.saveQuestions(questions, for: newCategory)
        
        // Add the category to the list
        CustomCategoryManager.shared.addCustomCategory(name: categoryName, questions: questions)
        
        dismiss()
    }
}
