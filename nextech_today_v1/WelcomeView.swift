// WelcomeView.swift
// Pantalla de bienvenida minimalista con fondo Liquid Glass y transición animada.
// Cumple con requisitos de accesibilidad y experiencia de usuario moderna.
import SwiftUI

struct WelcomeView: View {
    @Binding var showWelcome: Bool
    
    var body: some View {
        ZStack {
            VisualEffectBlur(blurStyle: .systemUltraThinMaterial)
                .ignoresSafeArea()
            VStack(spacing: 32) {
                Image(systemName: "clock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.primary)
                    .shadow(radius: 10)
                    .accessibilityHidden(true)
                Text("Reloj Minimalista")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.primary)
                    .accessibilityLabel(Text("Bienvenido a Reloj Minimalista"))
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        showWelcome = false
                    }
                }) {
                    Text("Comenzar")
                        .font(.title2)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 12)
                        .background(
                            Capsule()
                                .fill(.ultraThinMaterial)
                                .shadow(radius: 8)
                        )
                        .foregroundStyle(.primary)
                }
                .accessibilityLabel(Text("Comenzar"))
            }
            .padding(40)
            .background(
                RoundedRectangle(cornerRadius: 32, style: .continuous)
                    .fill(.ultraThinMaterial)
                    .shadow(radius: 16)
                    .opacity(0.85)
            )
            .transition(.opacity.combined(with: .scale))
        }
    }
} 