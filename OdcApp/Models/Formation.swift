//
//  Formation.swift
//  OdcApp
//
//  Created by Maminiaina Indrafo on 02/07/2026.
//
import Foundation

struct Formation: Identifiable, Codable {
    let id: UUID
    var titre: String
    var categorie: String
    var description: String
    var dateDebut: Date
    var dureeEnJours: Int
    var placesDisponibles: Int

    init(
        id: UUID = UUID(),
        titre: String,
        categorie: String,
        description: String,
        dateDebut: Date,
        dureeEnJours: Int,
        placesDisponibles: Int
    ) {
        self.id = id
        self.titre = titre
        self.categorie = categorie
        self.description = description
        self.dateDebut = dateDebut
        self.dureeEnJours = dureeEnJours
        self.placesDisponibles = placesDisponibles
    }

    var dateFormatee: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: dateDebut)
    }
}



extension Formation {
    /// Données d'exemple pour le développement et les previews SwiftUI.
    static let exemples: [Formation] = [
        Formation(
            titre: "SwiftUI et iOS",
            categorie: "Développement mobile",
            description: "Construire des applications iOS modernes, rapides et connectées avec SwiftUI : interfaces déclaratives, architecture MVVM, connexion à des API REST.",
            dateDebut: Date().addingTimeInterval(86400 * 7),
            dureeEnJours: 5,
            placesDisponibles: 12
        ),
        Formation(
            titre: "Introduction à l'IA Générative",
            categorie: "Intelligence artificielle",
            description: "Comprendre les fondamentaux des modèles de langage et créer ses premiers prototypes avec des outils d'IA générative.",
            dateDebut: Date().addingTimeInterval(86400 * 14),
            dureeEnJours: 3,
            placesDisponibles: 20
        ),
        Formation(
            titre: "Développement Web avec React",
            categorie: "Développement web",
            description: "Apprendre à construire des interfaces web réactives et performantes avec React et son écosystème.",
            dateDebut: Date().addingTimeInterval(86400 * 21),
            dureeEnJours: 4,
            placesDisponibles: 15
        ),
        Formation(
            titre: "Cybersécurité : les fondamentaux",
            categorie: "Sécurité",
            description: "Les bonnes pratiques essentielles pour sécuriser ses applications et protéger les données des utilisateurs.",
            dateDebut: Date().addingTimeInterval(86400 * 28),
            dureeEnJours: 2,
            placesDisponibles: 18
        ),
    ]
}
