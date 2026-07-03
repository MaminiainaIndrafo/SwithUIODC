//
//  ODCTheme.swift
//  OdcApp
//
//  Created by Maminiaina Indrafo on 01/07/2026.
//
import SwiftUI

enum ODCTheme {
    static let orange = Color("ODCOrange")
    static let orangeDark  = Color("ODCOrangeDark")
    static let dark        = Color("ODCDark")
    static let slate       = Color("ODCSlate")
    static let background  = Color("ODCBackground")
    static let cardBackground = Color("CardBackground")
}


// MARK: - Styles de boutons

struct ODCPrimaryButtonStyle: ButtonStyle {
    var isLoading: Bool = false
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(ODCTheme.orange.opacity(configuration.isPressed ? 0.8 : 1))
            .cornerRadius(12)
            .opacity(isLoading ? 0.6 : 1)
    }
}

struct ODCSecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(ODCTheme.orange)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.clear)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(ODCTheme.orange, lineWidth: 1.5))
            .opacity(configuration.isPressed ? 0.6 : 1)
    }
}

struct ODCTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(14)
            .background(Color.cardBackground)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black.opacity(0.08), lineWidth: 1))
    }
}
