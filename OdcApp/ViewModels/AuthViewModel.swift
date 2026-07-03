//
//  AuthViewModel.swift
//  OdcApp
//
//  Created by Maminiaina Indrafo on 02/07/2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class AuthViewModel: ObservableObject{
    @Published var utilisateurConnecte: Utilisateur?
    @Published var estConnecte: Bool = false
    @Published var enCours: Bool = false
    @Published var messageErreur: String?
    
    /// Base "utilisateurs" simulée en mémoire (remplacer par un backend réel).
    private var utilisateursEnregistres: [String: (motDePasse: String, utilisateur: Utilisateur)] = [:]
    
    
    func inscrire(nom: String, email: String, motDePasse: String, confirmation: String) {
        messageErreur = nil

        guard !nom.trimmingCharacters(in: .whitespaces).isEmpty else {
            messageErreur = "Merci de renseigner votre nom."
            return
        }
        guard email.contains("@"), email.contains(".") else {
            messageErreur = "Adresse email invalide."
            return
        }
        guard motDePasse.count >= 6 else {
            messageErreur = "Le mot de passe doit contenir au moins 6 caractères."
            return
        }
        guard motDePasse == confirmation else {
            messageErreur = "Les mots de passe ne correspondent pas."
            return
        }
        guard utilisateursEnregistres[email] == nil else {
            messageErreur = "Un compte existe déjà avec cet email."
            return
        }

        enCours = true
        
        // Simulation d'un appel réseau (remplacer par URLSession + API ODC).
        Task {
            try? await Task.sleep(nanoseconds: 600_000_000)
            let nouvelUtilisateur = Utilisateur(nom: nom, email: email)
            utilisateursEnregistres[email] = (motDePasse, nouvelUtilisateur)
            utilisateurConnecte = nouvelUtilisateur
            estConnecte = false
            enCours = false
        }
    }
    
    
    func connecter(email: String, motDePasse: String) {
        messageErreur = nil
        
        guard !email.isEmpty, !motDePasse.isEmpty else {
            messageErreur = "Merci de renseigner vos identifiants."
            return
        }
        
        enCours = true
        Task {
            try? await Task.sleep(nanoseconds: 600_000_000)
            if let compte = utilisateursEnregistres[email], compte.motDePasse == motDePasse {
                utilisateurConnecte = compte.utilisateur
                estConnecte = true
            } else {
                messageErreur = "Email ou mot de passe incorrect."
            }
            enCours = false
        }
        
    }
    
    func deconnecter() {
        utilisateurConnecte = nil
        estConnecte = false
    }
    
    func estInscrit(a formationID: UUID) -> Bool {
        utilisateurConnecte?.inscriptions.contains(formationID) ?? false
    }
    
    /// Ajoute une formation à la liste des inscriptions de l'utilisateur connecté.
    func rejoindreFormation(_ formationID: UUID) {
        
        guard var utilisateur = utilisateurConnecte else { return }
        
        if !utilisateur.inscriptions.contains(formationID) {
            utilisateur.inscriptions.append(formationID)
            utilisateurConnecte = utilisateur
            if let email = utilisateursEnregistres.first(where: { $0.value.utilisateur.id == utilisateur.id })?.key {
                utilisateursEnregistres[email]?.utilisateur = utilisateur
            }
        }
    }
}
