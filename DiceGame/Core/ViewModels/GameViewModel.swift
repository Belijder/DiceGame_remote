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
//    let container: NSPersistentContainer
//    var savedEntity: [GameProgressEntity] = []
    
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
    
//    func fetchGameProgress() {
//        let request = NSFetchRequest<GameProgressEntity>(entityName: "GameProgressEntity")
//        do {
//           savedEntity = try container.viewContext.fetch(request)
//            if !savedEntity.isEmpty {
//                gameManager.gameIsInProgress = savedEntity[0].gameIsInProgress
//                gameManager.gameIsEnded = savedEntity[0].gameIsEnded
//                gameManager.currentNumberOfdiceRolls = Int(savedEntity[0].currentNumberOfdiceRolls)
//                gameManager.currentPlayer = Int(savedEntity[0].currentPlayer)
//
//                if let playerScoresData = savedEntity[0].playersScores {
//                    do {
//                        let decodedPlayerScores = try JSONDecoder().decode([PlayerScore].self, from: playerScoresData)
//                        gameManager.playersScores = decodedPlayerScores
//                    } catch let error {
//                        print("Error decoding data for playersScores: \(error)")
//                    }
//                } else {
//                    gameManager.prepareNewGame()
//                }
//
//                if let DicesData = savedEntity[0].dices {
//                    do {
//                        let decodedDicesData = try JSONDecoder().decode([PlayerScore].self, from: DicesData)
//                        gameManager.playersScores = decodedDicesData
//                    } catch let error {
//                        print("Error decoding data for dices: \(error)")
//                    }
//                } else {
//                    gameManager.prepareNewGame()
//                }
//
//                if let activPlayersData = savedEntity[0].isActivPlayerAt {
//                    do {
//                        let decodedActivPlayersData = try JSONDecoder().decode([PlayerScore].self, from: activPlayersData)
//                        gameManager.playersScores = decodedActivPlayersData
//                    } catch let error {
//                        print("Error decoding data for activPlayers: \(error)")
//                    }
//                } else {
//                    gameManager.prepareNewGame()
//                }
//            }
//        } catch let error {
//            print("Error fetching. \(error)")
//            gameManager.prepareNewGame()
//        }
//    }
    
    
    
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
