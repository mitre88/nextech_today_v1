// ContentView.swift
// Vista principal que muestra la hora actual en el centro con estilo Liquid Glass.
// Cumple con requisitos de minimalismo, accesibilidad y animaciones sutiles.
//
//  Created by Dr. Alex Mitre on 21/07/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var currentTime: String = ContentView.getCurrentTime()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // Fondo estilo Liquid Glass
            VisualEffectBlur(blurStyle: .systemUltraThinMaterial)
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.5), value: currentTime)
            
            VStack {
                Text(currentTime)
                    .font(.system(size: 64, weight: .semibold, design: .rounded))
                    .foregroundStyle(.primary)
                    .padding(40)
                    .background(
                        RoundedRectangle(cornerRadius: 32, style: .continuous)
                            .fill(.ultraThinMaterial)
                            .shadow(radius: 16)
                            .opacity(0.8)
                    )
                    .accessibilityLabel(Text("Hora actual: \(currentTime)"))
                    .transition(.opacity.combined(with: .scale))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                currentTime = ContentView.getCurrentTime()
            }
        }
    }
    
    static func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter.string(from: Date())
    }
}

// VisualEffectBlur para fondo estilo glass
struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview {
    ContentView()
}
