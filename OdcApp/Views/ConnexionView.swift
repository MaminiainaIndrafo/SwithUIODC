//
//  ConnexionView.swift
//  OdcApp
//
//  Created by Maminiaina Indrafo on 01/07/2026.
//


import SwiftUI

struct ConnexionView: View {
    
    @EnvironmentObject var auth: AuthViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var email = ""
    @State private var motDePasse = ""
    
    var body: some View {
        
        NavigationStack{
            ScrollView {
                VStack(spacing: 22){
                    Image("ODCLogo")
                        .resizable().scaledToFit()
                        .frame(height: 100)
                        .padding(.top, 12)
                    
                    
                    VStack(spacing: 6) {
                        Text("Connexion")
                            .font(.title.bold())
                        Text("Accédez à votre espace ODC")
                            .font(.subheadline)
                            .foregroundColor(ODCTheme.slate)
                    }
                    
                    VStack(spacing: 12){
                        TextField("Adresse email", text: $email)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                            .textFieldStyle(ODCTextFieldStyle())
                        
                        SecureField("Mot de passe", text: $motDePasse)
                            .textFieldStyle(ODCTextFieldStyle())
                        
                        
                        if let erreur = auth.messageErreur {
                            Text(erreur)
                                .font(.footnote)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                        
                        Button{
                            
                                auth.connecter(email: email, motDePasse: motDePasse)
                        
                        } label : {
                            if auth.enCours {
                                ProgressView().tint(.white)
                            } else {
                                Text("Se connecter")
                            }
                        }
                        .buttonStyle(ODCPrimaryButtonStyle())
                        
                    }
                    
                }
                .padding(24)
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("X") {
                        dismiss()
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    ConnexionView().environmentObject(AuthViewModel())
}
