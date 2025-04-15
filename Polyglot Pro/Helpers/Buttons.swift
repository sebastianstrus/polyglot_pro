//
//  PolyButton.swift
//  Polyglot Pro
//
//  Created by Sebastian Strus on 2025-04-15.
//

/*
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

struct PolyButton: View {
        
    var body: some View {
        
        let lightColors: [Color] = [Color.cyan.opacity(0.05), Color.blue.opacity(0.1)]
        let darkColors: [Color] = [Color(red: 5/255, green: 10/255, blue: 13/255), Color(red: 15/255, green: 6/255, blue: 20/255)]
        
        LinearGradient(
            gradient: Gradient(colors: settings.isDarkMode ? darkColors : lightColors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}


struct IconButton: View {
    var title: String
    var icon: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
*/
