//
//  Toast.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-18.
//

struct Toast: Equatable {
  var style: ToastStyle
  var message: String
  var duration: Double = 3
  var width: Double = .infinity
}


import SwiftUI

enum ToastStyle {
  case error
  case warning
  case success
  case info
}

extension ToastStyle {
  var themeColor: Color {
    switch self {
    case .error: return Color.red
    case .warning: return Color.orange
    case .info: return Color.blue
    case .success: return Color.green
    }
  }
  
  var iconFileName: String {
    switch self {
    case .info: return "info.circle.fill"
    case .warning: return "exclamationmark.triangle.fill"
    case .success: return "checkmark.circle.fill"
    case .error: return "xmark.circle.fill"
    }
  }
}







import SwiftUI

struct ToastView: View {
    
    @EnvironmentObject var settings: SettingsManager
  
  var message: String
  var width = CGFloat.infinity
  var onCancelTapped: (() -> Void)
  
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      Image(systemName: "info.circle.fill")
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(Color.purple)
      Text(message)
        .font(Font.caption)
        .foregroundColor(settings.isDarkMode ? .black : .white)
      
      Spacer(minLength: 10)
      
      Button {
        onCancelTapped()
      } label: {
        Image(systemName: "xmark")
              .resizable()
              .frame(width: 18, height: 18)
              .foregroundColor(Color.purple)
      }
    }
    .padding()
    .frame(minWidth: 0, maxWidth: width)
    .background(settings.isDarkMode ? Color.white.opacity(0.95) : Color.black.opacity(0.90))
    .cornerRadius(8)
    .padding(.horizontal, 16)
  }
}








import SwiftUI

struct ToastModifier: ViewModifier {

    @Binding var toast: Toast?
    @State private var workItem: DispatchWorkItem?

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    mainToastView()
                        .offset(y: 32)
                }
                .animation(.spring(), value: toast)
            )
            .onChange(of: toast) { _ in
                showToast()
            }
    }

    @ViewBuilder
    private func mainToastView() -> some View {
        if let toast = toast {
            VStack {
                ToastView(
                    message: toast.message,
                    width: toast.width
                ) {
                    dismissToast()
                }
                Spacer()
            }
        }
    }

    private func showToast() {
        guard let toast = toast else { return }

        #if os(iOS)
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        #elseif os(macOS)
        NSSound(named: "Submarine")?.play() // Or your own sound
        #endif

        if toast.duration > 0 {
            workItem?.cancel()

            let task = DispatchWorkItem {
                dismissToast()
            }

            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
        }
    }

    private func dismissToast() {
        withAnimation {
            toast = nil
        }

        workItem?.cancel()
        workItem = nil
    }
}
