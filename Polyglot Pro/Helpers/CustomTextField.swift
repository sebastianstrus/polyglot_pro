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
        MacOSTextField(placeholder, text: $text, isCorrect: $isCorrect, onCommit: onCommit)
#endif
    }
}

#if os(macOS)
struct MacOSTextField: NSViewRepresentable {
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
    
    func makeNSView(context: Context) -> NSTextField {
        let textField = NsCustomTextField(string: text)
        textField.delegate = context.coordinator
        textField.isEditable = true
        textField.drawsBackground = false
        textField.placeholderString = placeholder
        textField.isBezeled = false
        textField.font = NSFont.systemFont(ofSize: 28)
        textField.isEditable = !(isCorrect ?? false)
        textField.alignment = .center
        return textField
    }
    
    func updateNSView(_ nsView: NSTextField, context: Context) {
        guard let textField = nsView as? NsCustomTextField else { return }
        
        if textField.stringValue != text {
            textField.stringValue = text
        }
        
        if let isCorrect = isCorrect {
            textField.textColor = isCorrect ? .green : .red
        } else {
            textField.textColor = .gray
        }
        textField.isEditable = !(isCorrect ?? false)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, NSTextFieldDelegate {
        var parent: MacOSTextField
        
        init(_ parent: MacOSTextField) {
            self.parent = parent
        }
        
        func controlTextDidChange(_ obj: Notification) {
            if let textField = obj.object as? NSTextField {
                parent.text = textField.stringValue
            }
        }
        
        func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
            if commandSelector == #selector(NSResponder.insertNewline(_:)) {
                parent.onCommit?()
                return true
            }
            return false
        }
    }
}

class NsCustomTextField: NSTextField {
    
    override func drawFocusRingMask() {
    }
    
    override var focusRingType: NSFocusRingType {
        get { return .none }
        set { }
    }
}

#elseif os(iOS)
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
        textField.textAlignment = .center
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
            DispatchQueue.main.async {
                self.parent.text = textField.text ?? ""
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            parent.onCommit?()
            textField.resignFirstResponder()
            return true
        }
    }
}
#endif
