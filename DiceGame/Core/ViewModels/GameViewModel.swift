//
//  ContentViewVM.swift
//  DiceGame
//
//  Created by Jakub Zajda on 19/12/2021.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    
    @ObservedObject var gameManager: GameManager
    
    func addPlayer() {
        gameManager.addPlayer()
        gameManager.isActivPlayerAt[0] = true
    }
    
    func selectDiceToRoll(index: Int) {
        if let indx = gameManager.dices.firstIndex(where: { $0.id == gameManager.dices[index].id }) {
            gameManager.dices[indx].isblocked = false
        }
    }
    
    func unselectDice(index: Int) {
        if let indx = gameManager.dices.firstIndex(where: { $0.id == gameManager.dices[index].id }) {
            gameManager.dices[indx].isblocked = true
        }
    }
    
    init(gameManager: GameManager) {
        self.gameManager = gameManager
    }

}
