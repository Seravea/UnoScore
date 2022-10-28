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
    static let zero = Card(name: "0", points: 0)
    static let one = Card(name: "1", points: 1)
    static let two = Card(name: "2", points: 2)
    static let three = Card(name: "3", points: 3)
    static let four = Card(name: "4", points: 4)
    static let five = Card(name: "5", points: 5)
    static let six = Card(name: "6", points: 6)
    static let seven = Card(name: "7", points: 7)
    static let eight = Card(name: "8", points: 8)
    static let nine = Card(name: "9", points: 9)
    static let plusTwo = Card(name: "+2", points: 20)
    static let plusFour = Card(name: "+4", points: 50)
    static let changeColor = Card(name: "ChangeColor", points: 50)
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
