//
//  FormationDetailView.swift
//  PreparationODC
//
//  Created by Maminiaina Indrafo on 30/06/2026.
//


import SwiftUI

struct FormationDetailView: View {
    
    @EnvironmentObject var auth: AuthViewModel
    
    let formation: Formation

    @State private var afficherConfirmation = false

    private var estInscrit: Bool {
        auth.estInscrit(a: formation.id)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 22) {
                ZStack(alignment: .bottomLeading) {
                    LinearGradient(
                        colors: [ODCTheme.orange, ODCTheme.orangeDark],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(height: 160)

                    VStack(alignment: .leading, spacing: 6) {
                        Text(formation.categorie.uppercased())
                            .font(.caption.bold())
                            .foregroundColor(.white.opacity(0.85))
                        Text(formation.titre)
                            .font(.title2.bold())
                            .foregroundColor(.white)
                    }
                    .padding(20)
                }

                VStack(alignment: .leading, spacing: 18) {
                    infosPratiques

                    VStack(alignment: .leading, spacing: 8) {
                        Text("À propos de la formation")
                            .font(.headline)
                        Text(formation.description)
                            .font(.body)
                            .foregroundColor(ODCTheme.slate)
                    }

                    boutonParticiper
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert("Inscription confirmée", isPresented: $afficherConfirmation) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Vous êtes inscrit(e) à \"\(formation.titre)\". Un email de confirmation vous sera envoyé.")
        }
    }

    private var infosPratiques: some View {
        HStack(spacing: 0) {
            infoItem(icone: "calendar", titre: "Début", valeur: formation.dateFormatee)
            Divider().frame(height: 36)
            infoItem(icone: "clock", titre: "Durée", valeur: "\(formation.dureeEnJours) jours")
            Divider().frame(height: 36)
            infoItem(icone: "person.2", titre: "Places", valeur: "\(formation.placesDisponibles)")
        }
        .padding(.vertical, 14)
        .background(ODCTheme.cardBackground)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.05), radius: 6, y: 3)
    }

    private func infoItem(icone: String, titre: String, valeur: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icone)
                .foregroundColor(ODCTheme.orange)
            Text(valeur)
                .font(.subheadline.bold())
            Text(titre)
                .font(.caption2)
                .foregroundColor(ODCTheme.slate)
        }
        .frame(maxWidth: .infinity)
    }

    private var boutonParticiper: some View {
        Button {
            guard auth.estConnecte else { return }
            
            auth.rejoindreFormation(formation.id)
            
            afficherConfirmation = true
        } label: {
            HStack {
                Image(systemName: estInscrit ? "checkmark.circle.fill" : "hand.raised.fill")
                Text(estInscrit ? "Vous participez déjà" : "Je participe")
            }
        }
        .buttonStyle(ODCPrimaryButtonStyle())
        .disabled(estInscrit)
        .opacity(estInscrit ? 0.6 : 1)
        .padding(.top, 8)
    }
}

#Preview {
    NavigationStack {
        FormationDetailView(formation: Formation.exemples[0])
            .environmentObject(AuthViewModel())
    }
}
