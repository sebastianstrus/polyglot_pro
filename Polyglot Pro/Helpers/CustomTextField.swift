//
//  CustopTextField.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-03-17.
//


import SwiftUI

struct CustomTextField: View {
    var placeholder: String // No longer optional
    @Binding var text: String
    @Binding var isCorrect: Bool?
    var onCommit: (() -> Void)?
    
    init(_ placeholder: String, text: Binding<String>, isCorrect: Binding<Bool?>, onCommit: (() -> Void)? = nil) {
        self.placeholder = placeholder
        self._text = text
        self._isCorrect = isCorrect
        self.onCommit = onCommit
    }
    
    var body: some View {
        #if os(iOS)
        UIKitTextField(placeholder, text: $text, isCorrect: $isCorrect, onCommit: onCommit)
        #else
        TextField(placeholder, text: $text, onCommit: {
            onCommit?()
        })
        .textFieldStyle(.plain)
        #endif
    }
}

#if os(iOS)
struct UIKitTextField: UIViewRepresentable {
    var placeholder: String
    @Binding var text: String
    @Binding var isCorrect: Bool?
    var onCommit: (() -> Void)?
    
    init(_ placeholder: String, text: Binding<String>, isCorrect: Binding<Bool?>, onCommit: (() -> Void)? = nil) {
        self.placeholder = placeholder
        self._text = text
        self._isCorrect = isCorrect
        self.onCommit = onCommit
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        textField.borderStyle = .roundedRect
        textField.textColor = .gray
        textField.delegate = context.coordinator
        
        
        
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        if let isCorrect = isCorrect {
            uiView.textColor = isCorrect ? .green : .red
        } else {
            uiView.textColor = .gray
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: UIKitTextField

        init(_ parent: UIKitTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            parent.onCommit?()
            textField.resignFirstResponder()
            return true
        }
    }
}
#endif
