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
    
 
    func addCardScore(card: Card){
        
    }
    
}

class ViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var cards: [Card] = Card.cardsArray
    
    @Published var gameIsFinished = false
    
    func removeScoreIsOK(editValue: Int, userIndex: Int) -> Bool {
        
        if editValue > users[userIndex].score {
                return true
            }else {
                return false
            }
    }
    func cardSetToZero(cards: [Card]) {
        for card in cards {
            card.totalPoint = 0
        }
    }
    
    func sortedArrayByScore(users: [User]) {
        self.users = users.sorted(by: { $0.score < $1.score})
    }
}
