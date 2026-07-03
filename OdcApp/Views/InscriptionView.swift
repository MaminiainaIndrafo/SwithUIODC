//
//  InscriptionView.swift
//  PreparationODC
//
//  Created by Maminiaina Indrafo on 30/06/2026.
//


import SwiftUI

struct InscriptionView: View {
    
    @EnvironmentObject var auth: AuthViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var nom = ""
    @State private var email = ""
    @State private var motDePasse = ""
    @State private var confirmation = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 22) {
                    Image("ODCLogo")
                        .resizable().scaledToFit()
                        .frame(height: 100)
                        .padding(.top, 12)

                    VStack(spacing: 6) {
                        Text("Créer un compte")
                            .font(.title.bold())
                        Text("Rejoignez la communauté ODC")
                            .font(.subheadline)
                            .foregroundColor(ODCTheme.slate)
                    }

                    VStack(spacing: 14) {
                        TextField("Nom complet", text: $nom)
                            .textFieldStyle(ODCTextFieldStyle())

                        TextField("Adresse email", text: $email)
                            .textFieldStyle(ODCTextFieldStyle())
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()

                        SecureField("Mot de passe", text: $motDePasse)
                            .textFieldStyle(ODCTextFieldStyle())

                        SecureField("Confirmer le mot de passe", text: $confirmation)
                            .textFieldStyle(ODCTextFieldStyle())
                    }
                    
                    if let erreur = auth.messageErreur {
                        Text(erreur)
                            .font(.footnote)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    Button {
                        auth.inscrire(nom: nom, email: email, motDePasse: motDePasse, confirmation: confirmation)
                    } label: {
                        if auth.enCours {
                            ProgressView().tint(.white)
                        } else {
                            Text("S'inscrire")
                        }
                    }
                    .buttonStyle(ODCPrimaryButtonStyle())
                }
                .padding(24)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("X") { dismiss() }
                }
            }
        }
        
    }
}

#Preview {
    InscriptionView().environmentObject(AuthViewModel())
}
