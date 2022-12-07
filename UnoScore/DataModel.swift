//
//  DataModel.swift
//  UnoScore
//
//  Created by Romain Poyard on 16/08/2022.
//

import Foundation
import SwiftUI


struct User: Identifiable, Hashable, Codable {
    let id = UUID()
    let name: String
    var score: Int = 0
    
    
    
    
}



extension Card {
    static let zero = Card(name: "zeroPDF", points: 0)
    static let one = Card(name: "carteUne", points: 1)
    static let two = Card(name: "carteDeux", points: 2)
    static let three = Card(name: "carteTrois", points: 3)
    static let four = Card(name: "carteQuatre", points: 4)
    static let five = Card(name: "carteCinq", points: 5)
    static let six = Card(name: "carteSix", points: 6)
    static let seven = Card(name: "carteSept", points: 7)
    static let eight = Card(name: "carteHuit", points: 8)
    static let nine = Card(name: "carteNeuf", points: 9)
    static let plusTwo = Card(name: "plusTwo", points: 20)
    static let plusFour = Card(name: "plusQuatre", points: 50)
    static let changeColor = Card(name: "changeColor", points: 50)
    static let tourChange = Card(name: "tourChange", points: 20)
    static let tourPass = Card(name: "tourPass", points: 20)
    
    static let cardsArray = [one, two, three, four, five, six, seven, eight, nine, plusTwo, plusFour, changeColor, tourChange, tourPass]
}

extension User {
    static let romain = User(name: "Romain")
    static let mathilde = User(name: "Mathilde")
    static let test = User(name: "Test")
    static let adeline = User(name: "Adeline")
}


enum EndGame: String {
    case newGame = "Voulez-vous commencer une nouvelle partie ?"
    case restartGame = "Voulez-vous rejouer la partie avec les mêmes joueurs ?"
}
