//
//  DataViewModel.swift
//  UnoScore
//
//  Created by Romain Poyard on 16/08/2022.
//

import Foundation
import SwiftUI


class Card: ObservableObject, Identifiable {
    let id = UUID()
    let name: String
    let points: Int
    var totalPoint = 0
    
    init(name: String, points: Int) {
        self.name = name
        self.points = points
    }
    
    func setToZero(card: Card) {
        card.totalPoint = 0
    }
    func addCardScore(card: Card){
        
    }
    
    
}

class ViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var cards: [Card] = Card.cardsArray
    
    func removeScoreIsOK(editValue: Int, userIndex: Int) -> Bool {
        
        if editValue > users[userIndex].score {
                return true
            }else {
                return false
            }
        
        
    }
}
