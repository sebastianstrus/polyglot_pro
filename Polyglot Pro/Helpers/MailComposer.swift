//
//  MailComposer.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-02.
//

import MessageUI
import SwiftUI

struct MailComposer: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    let screenshot: UIImage?
    let recipient: String
    let subject: String
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var isPresented: Bool
        
        init(isPresented: Binding<Bool>) {
            _isPresented = isPresented
        }
        
        func mailComposeController(
            _ controller: MFMailComposeViewController,
            didFinishWith result: MFMailComposeResult,
            error: Error?
        ) {
            isPresented = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isPresented: $isPresented)
    }
    
    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = context.coordinator
        mail.setToRecipients([recipient])
        mail.setSubject(subject)
        mail.setMessageBody(getEmailBody(), isHTML: false)
        
        if let screenshotData = screenshot?.pngData() {
            mail.addAttachmentData(screenshotData, mimeType: "image/png", fileName: "screenshot.png")
        }
        
        return mail
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
    
    private func getEmailBody() -> String {
        """
        \("Let us know how we can improve the app. We appreciate your input!".localized)
        
        \("Feedback:".localized)
        
        
        
        
        ------------------
        Device: \(UIDevice.current.modelName)
        iOS: \(UIDevice.current.systemVersion)
        App Version: \(Bundle.main.appVersion)
        Screen: \(UIDevice.current.screenSizePoints) (\(UIDevice.current.screenSizePixels))
        
        """
    }
}
