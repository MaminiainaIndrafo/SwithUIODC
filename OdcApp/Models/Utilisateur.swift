//
//  Utilisateur.swift
//  OdcApp
//
//  Created by Maminiaina Indrafo on 01/07/2026.
//
import Foundation

struct Utilisateur: Identifiable, Codable{
    let id: UUID
    var nom: String
    var email: String
    var inscriptions: [UUID] // identifiants des formations rejointes
    
    
    init(id: UUID = UUID(), nom: String, email: String, inscriptions: [UUID] = []) {
        self.id = id
        self.nom = nom
        self.email = email
        self.inscriptions = inscriptions
    }
    
}
