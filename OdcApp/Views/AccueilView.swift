//
//  AccueilView.swift
//  OdcApp
//
//  Created by Maminiaina Indrafo on 01/07/2026.
//

import SwiftUI

struct AccueilView: View {
    
    @EnvironmentObject var auth: AuthViewModel
    
    @State private var afficherConnexion = false
    @State private var afficherInscription = false
    
    var body: some View {
        
        ZStack {
            
            VStack (spacing: 0)  {
                
                Spacer()
                
                Image("ODCLogo")
                    .resizable().scaledToFit()
                    .frame(height: 100)
                
                Text("Orange Digital Center")
                    .font(.title2.bold())
                
                Text("Formations, ateliers et événements tech pour développer vos compétences numériques.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                
                
                Spacer()
                
                
                
                VStack(spacing: 14) {
                    
                    Button("Se connecter", action:{
                        afficherConnexion = true
                    }
                    ).buttonStyle(ODCPrimaryButtonStyle())
                    
                    
                    
                    Button("Créer un compte", action:{
                        afficherInscription = true
                    }
                    )
                    .buttonStyle(ODCSecondaryButtonStyle())
                    
                    
                }
                .padding(.horizontal, 28)
                .padding(.bottom, 48)
                
            }
        }.sheet(isPresented: $afficherConnexion) {
            ConnexionView()
        }.sheet(isPresented: $afficherInscription){
            InscriptionView()
        }
        
    }
    
}

#Preview {
    AccueilView()
}
