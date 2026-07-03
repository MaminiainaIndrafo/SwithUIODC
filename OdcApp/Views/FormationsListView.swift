//
//  FormationsListView.swift
//  PreparationODC
//
//  Created by Maminiaina Indrafo on 30/06/2026.
//


import SwiftUI

struct FormationsListView: View {
    @EnvironmentObject var auth: AuthViewModel
    
    @State private var formations: [Formation] = Formation.exemples

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    enTete

                    LazyVStack(spacing: 14) {
                        ForEach(formations) { formation in
                            NavigationLink {
                                FormationDetailView(formation: formation)
                                    .environmentObject(auth)
                            } label: {
                                FormationCardView(
                                    formation: formation,
                                    estInscrit: auth.estInscrit(a: formation.id)
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 24)
                }
            }
            .navigationBarHidden(true)
        }
    }

    private var enTete: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Bonjour \(auth.utilisateurConnecte?.nom.components(separatedBy: " ").first ?? "")")
                    .font(.title2.bold())
                Text("Découvrez nos prochaines formations")
                    .font(.subheadline)
                    .foregroundColor(ODCTheme.slate)
            }
            Spacer()
            
            Button {
                auth.deconnecter()
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .foregroundColor(ODCTheme.orange)
                    .font(.title3)
            }
            
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
    }
}

/// Carte résumant une formation dans la liste.
struct FormationCardView: View {
    let formation: Formation
    let estInscrit: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(formation.categorie.uppercased())
                    .font(.caption.bold())
                    .foregroundColor(ODCTheme.orange)
                Spacer()
                if estInscrit {
                    Label("Inscrit", systemImage: "checkmark.circle.fill")
                        .font(.caption.bold())
                        .foregroundColor(.green)
                }
            }

            Text(formation.titre)
                .font(.headline)
                .foregroundColor(.black)

            Text(formation.description)
                .font(.footnote)
                .foregroundColor(ODCTheme.slate)
                .lineLimit(2)

            HStack(spacing: 16) {
                Label(formation.dateFormatee, systemImage: "calendar")
                Label("\(formation.dureeEnJours) jours", systemImage: "clock")
                Label("\(formation.placesDisponibles) places", systemImage: "person.2")
            }
            .font(.caption)
            .foregroundColor(ODCTheme.slate)
        }
        .padding(16)
        .background(ODCTheme.cardBackground)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.05), radius: 6, y: 3)
    }
}

#Preview {
    FormationsListView().environmentObject(AuthViewModel())
}
