//
//  Polyglot_ProApp.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-02-16.
//

import SwiftUI

@main
struct Polyglot_ProApp: App {
    
    @StateObject private var settings = SettingsManager.shared
    
    let minWidth: CGFloat = {
        switch Platform.current {
        case .macOS: return 1350
        default: return 100
        }
    }()
    
    let minHeight: CGFloat = {
        switch Platform.current {
        case .macOS: return 800
        default: return 100
        }
    }()
    
    
    init() {
#if os(macOS)
        Task {
            NSApp.appearance = NSAppearance(named: .aqua)
        }
#endif
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(settings)
                .frame(minWidth: minWidth, maxWidth: .infinity, minHeight: minHeight, maxHeight: .infinity)
                .preferredColorScheme(settings.isDarkMode ? .dark : .light)
//            ContentView()
            
            
        }
    }
}

/* upload: sv_adjectives_colors.json
Hej. Tworzę aplikację do nauki języka szwedzkiego dla osób, które już znają inne języki. Potrzebuję więcej wyrazen z tłumaczeniami. Do każdego wyrazenia 4 przykłady zdań, które też są przetłumaczone. Potrzebuję te wyrazenia w formacie json. Wysyłam Ci plik json z przykładową inną kategorią i proszę stwórz nowy plik z poniższymi wyrazeniami. Wykorzystaj koniecznie wszystkie poniżej. Użyj wszystkie słowa. Aż do końca.

nyligen, idag, i morse, i kväll, i natt, om en stund, hädanefter, hittills, då och då, någon gång
*/


import SwiftUI

// The notification we'll send when a shake gesture happens.
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

// Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
        super.motionEnded(motion, with: event)
    }
}

// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

// A View extension to make the modifier easier to use.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}


extension View {
    func takeScreenshot(origin: CGPoint, size: CGSize) -> UIImage {
        let window = UIWindow(frame: CGRect(origin: origin, size: size))
        let hosting = UIHostingController(rootView: self)
        hosting.view.frame = window.frame
        window.addSubview(hosting.view)
        window.makeKeyAndVisible()
        
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            hosting.view.drawHierarchy(in: hosting.view.bounds, afterScreenUpdates: true)
        }
    }
}

extension UIView {
    var screenshot: UIImage {
        let renderer = UIGraphicsImageRenderer(size: bounds.size)
        return renderer.image { _ in
            drawHierarchy(in: bounds, afterScreenUpdates: true)
        }
    }
}


import MessageUI

struct MailView: UIViewControllerRepresentable {
    @Binding var isShowing: Bool
    @Binding var result: Result<MFMailComposeResult, Error>?
    var screenshot: UIImage?
    let recipient: String
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        @Binding var isShowing: Bool
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(isShowing: Binding<Bool>, result: Binding<Result<MFMailComposeResult, Error>?>) {
            _isShowing = isShowing
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                 didFinishWith result: MFMailComposeResult,
                                 error: Error?) {
            defer {
                isShowing = false
            }
            
            if let error = error {
                self.result = .failure(error)
                return
            }
            
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShowing: $isShowing, result: $result)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients([recipient])
        vc.setSubject("Feedback from Polyglot Pro App")
        vc.setMessageBody("Here's my feedback along with a screenshot:", isHTML: false)
        
        if let screenshot = screenshot, let imageData = screenshot.pngData() {
            vc.addAttachmentData(imageData, mimeType: "image/png", fileName: "screenshot.png")
        }
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                               context: UIViewControllerRepresentableContext<MailView>) {
    }
}




import SwiftUI

struct ContentView: View {
    @State private var isShowingMailView = false
    @State private var mailResult: Result<MFMailComposeResult, Error>?
    @State private var screenshot: UIImage?
    
    var body: some View {
        // Your main content view here
        VStack {
            Text("Shake me to send feedback!")
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .onShake {
            captureScreenshotAndPrepareEmail()
        }
        .sheet(isPresented: $isShowingMailView) {
            if MFMailComposeViewController.canSendMail() {
                MailView(isShowing: $isShowingMailView,
                         result: $mailResult,
                         screenshot: screenshot,
                         recipient: "feedback@polyglotpro.com")
            } else {
                Text("Can't send emails from this device")
            }
        }
    }
    
    private func captureScreenshotAndPrepareEmail() {
        // Get the key window
        guard let window = UIApplication.shared.windows.first else { return }
        
        // Take screenshot
        screenshot = window.screenshot
        
        // Show mail composer
        isShowingMailView = true
    }
}
