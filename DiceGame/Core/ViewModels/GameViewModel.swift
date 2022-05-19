//
//  ContentViewVM.swift
//  DiceGame
//
//  Created by Jakub Zajda on 19/12/2021.
//

import Foundation
import SwiftUI
import CoreData

class GameViewModel: ObservableObject {
    
    @ObservedObject var gameManager: GameManager
    let defaults = UserDefaults.standard
    
    var progress = ProgressModel(dices: [], playersScores: [], currentPlayer: 1, currentNumberOfdiceRolls: 0, gameIsEnded: false, gameIsInProgress: false, isActivPlayerAt: [false, false, false, false])
    
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

    func saveGameProgress() {
        progress.dices = gameManager.dices
        progress.playersScores = gameManager.playersScores
        progress.currentPlayer = gameManager.currentPlayer
        progress.currentNumberOfdiceRolls = gameManager.currentNumberOfdiceRolls
        progress.gameIsEnded = gameManager.gameIsEnded
        progress.gameIsInProgress = gameManager.gameIsInProgress
        progress.isActivPlayerAt = gameManager.isActivPlayerAt
        if let encodedData = try? JSONEncoder().encode(progress) {
            defaults.set(encodedData, forKey: "GameProgress")

        }
    }
    
    func loadGameProgress() {
        if let decodedData = defaults.object(forKey: "GameProgress") as? Data {
            if let savedProgress = try? JSONDecoder().decode(ProgressModel.self, from: decodedData) {
                progress = savedProgress
                gameManager.gameIsInProgress = progress.gameIsInProgress
                gameManager.dices = progress.dices
                gameManager.playersScores = progress.playersScores
                gameManager.currentPlayer = progress.currentPlayer
                gameManager.currentNumberOfdiceRolls = progress.currentNumberOfdiceRolls
                gameManager.gameIsEnded = progress.gameIsEnded
                gameManager.isActivPlayerAt = progress.isActivPlayerAt
            }
        } else {
            return
        }
    }

    init(gameManager: GameManager) {
        self.gameManager = gameManager
    }

}
