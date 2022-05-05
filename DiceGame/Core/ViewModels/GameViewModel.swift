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
    
    
    init(gameManager: GameManager) {
        self.gameManager = gameManager
    }
    
    
    
    
    
    
    
    
    
    
//    @Published var dices = [Dice]()
//    @Published var playersScores = [PlayerScore]()
//    @Published var currentNumberOfdiceRolls = 0
//    @Published var currentPlayer = 1
//    @Published var gameIsEnded = false
//    @Published var gameIsInProgress = false
//
//
//    @Published var isActivPlayerAt = [false, false, false, false]
//
//    @Published var ranking: [(String, Int)] = []
//
//    func roll() {
//        for number in 0...4 {
//            if dices[number].isblocked == false {
//                dices[number].rollDice()
//            }
//        }
//        for number in 0...4 {
//            dices[number].isblocked = true
//
//        }
//        currentNumberOfdiceRolls += 1
//    }
//
//    func changePlayer() {
//        if checkIfTheGameIsOver(playerScore: playersScores[playersScores.count - 1]) {
//            gameIsEnded = true
//        } else {
//            if currentPlayer == playersScores.count {
//                currentPlayer = 1
//            } else {
//                currentPlayer += 1
//            }
//            currentNumberOfdiceRolls = 0
//            for number in 0...4 {
//                dices[number].isblocked = false
//            }
//        }
//    }
//
//
//    func calculateTotalResult(forPlayer playerNumber: Int) -> Int {
//        let result = playersScores[playerNumber - 1].scores.map() { $0.value }.reduce(0, +)
//        let resultAsInt = Int(result)
//        return resultAsInt
//    }
//
//    func addPlayer() {
//        let newPlayer = PlayerScore(playerNumber: playersScores.count + 1)
//        playersScores.append(newPlayer)
//    }
//
//    func removePlayer(at index: Int) {
//        playersScores.remove(at: index)
//    }
//
//
//    func createPlayerRanking() {
//        var ranking: [String: Int] = [:]
//        for number in 0..<playersScores.count {
//            ranking.updateValue(calculateTotalResult(forPlayer: number + 1), forKey: playersScores[number].playerName)
//        }
//        let sortedRanking = ranking.sorted { $0.1 > $1.1 }
//        self.ranking = sortedRanking
//    }
//
//    func startNewGame() {
//        gameIsEnded = false
//        playersScores = []
//        isActivPlayerAt = [false, false, false, false]
//        currentPlayer = 1
//        currentNumberOfdiceRolls = 0
//    }
//
    
    
    
    
    
    
    
//    func calculatePossiblePointValueToSaveAsOnes() -> Double {
//        var totalValue = 0.0
//        var countDices = 0
//        for dice in dices {
//            if dice.value == 1 {
//                countDices += 1
//            }
//        }
//        totalValue = Double(countDices * 1)
//        return totalValue
//    }
//    
//    
//    func saveAsOnes(for playerNumber: Int) {
//        self.playersScores[playerNumber - 1].scores[.ones] = calculatePossiblePointValueToSaveAsOnes()
//    }
//    
//    func saveAsTwos(for playerNumber: Int) {
//        var totalValue = 0.0
//        var countDices = 0
//        
//        for dice in dices {
//            if dice.value == 2 {
//                countDices += 1
//            }
//        }
//        
//        totalValue = Double(countDices * 2)
//        self.playersScores[playerNumber - 1].scores[.twos] = totalValue
//    }
//    
//    func saveAsThrees(for playerNumber: Int) {
//        var totalValue = 0.0
//        var countDices = 0
//        
//        for dice in dices {
//            if dice.value == 3 {
//                countDices += 1
//            }
//        }
//        
//        totalValue = Double(countDices * 3)
//        self.playersScores[playerNumber - 1].scores[.threes] = totalValue
//        print(playersScores[playerNumber - 1].scores[.threes] as Any)
//        print("Total result for player \(playerNumber): \(calculateTotalResult(forPlayer: playerNumber))")
//    }
//    
//    func saveAsFours(for playerNumber: Int) {
//        var totalValue = 0.0
//        var countDices = 0
//        
//        for dice in dices {
//            if dice.value == 4 {
//                countDices += 1
//            }
//        }
//        
//        totalValue = Double(countDices * 4)
//        self.playersScores[playerNumber - 1].scores[.fours] = totalValue
//        print(playersScores[playerNumber - 1].scores[.fours] as Any)
//        print("Total result for player \(playerNumber): \(calculateTotalResult(forPlayer: playerNumber))")
//    }
//    
//    func saveAsFives(for playerNumber: Int) {
//        var totalValue = 0.0
//        var countDices = 0
//        
//        for dice in dices {
//            if dice.value == 5 {
//                countDices += 1
//            }
//        }
//        
//        totalValue = Double(countDices * 5)
//        self.playersScores[playerNumber - 1].scores[.fives] = totalValue
//        print(playersScores[playerNumber - 1].scores[.fives] as Any)
//        print("Total result for player \(playerNumber): \(calculateTotalResult(forPlayer: playerNumber))")
//    }
//    
//    func saveAsSixes(for playerNumber: Int) {
//        var totalValue = 0.0
//        var countDices = 0
//        
//        for dice in dices {
//            if dice.value == 6 {
//                countDices += 1
//            }
//        }
//        
//        totalValue = Double(countDices * 6)
//        self.playersScores[playerNumber - 1].scores[.sixes] = totalValue
//        print(playersScores[playerNumber - 1].scores[.sixes] as Any)
//        print("Total result for player \(playerNumber): \(calculateTotalResult(forPlayer: playerNumber))")
//    }
//    
//    func saveAsPair(for playerNumber: Int) {
//        var aor: [Int] = []
//        for dice in dices {
//            aor.append(dice.value)
//        }
//        aor.sort()
//        
//        if aor[4] == aor[3] {
//            playersScores[playerNumber - 1].scores[.pair] = Double(aor[4] + aor[3])
//        } else if aor[3] == aor[2] {
//            playersScores[playerNumber - 1].scores[.pair]  = Double(aor[3] + aor[2])
//        } else if aor[2] == aor[1] {
//            playersScores[playerNumber - 1].scores[.pair]  = Double(aor[2] + aor[1])
//        } else if aor[1] == aor[0] {
//            playersScores[playerNumber - 1].scores[.pair]  = Double(aor[1] + aor[0])
//        } else {
//            playersScores[playerNumber - 1].scores[.pair]  = 0
//        }
//        
//        print(playersScores[playerNumber - 1].scores[.pair] as Any)
//    }
//    
//    func saveAsTwoPairs(for playerNumber: Int) {
//        var aor: [Int] = []
//        for dice in dices {
//            aor.append(dice.value)
//        }
//        aor.sort()
//        
//        if aor[4] == aor[3] && aor[2] == aor[1] {
//            let totalValue = Double(aor[4] + aor[3] + aor[2] + aor[1])
//            playersScores[playerNumber - 1].scores[.twoPairs] = totalValue
//        } else if aor[4] == aor[3] && aor[1] == aor[0] {
//            let totalValue = Double(aor[4] + aor[3] + aor[1] + aor[0])
//            playersScores[playerNumber - 1].scores[.twoPairs] = totalValue
//        } else if aor[3] == aor[2] && aor[1] == aor[0] {
//            let totalValue = Double(aor[3] + aor[2] + aor[1] + aor[0])
//            playersScores[playerNumber - 1].scores[.twoPairs] = totalValue
//        } else {
//            playersScores[playerNumber - 1].scores[.twoPairs] = 0
//        }
//        print(playersScores[playerNumber - 1].scores[.twoPairs] as Any)
//    }
//    
//    func saveAsThreeOfKind(for playerNumber: Int) {
//        var aor: [Int] = []
//        for dice in dices {
//            aor.append(dice.value)
//        }
//        aor.sort()
//        
//        if aor[4] == aor[3] && aor [3] == aor[2] {
//            let totaValue = Double(aor[4] + aor[3] + aor[2])
//            playersScores[playerNumber - 1].scores[.threeOfKind] = totaValue
//        } else if aor[3] == aor[2] && aor [2] == aor[1] {
//            let totaValue = Double(aor[3] + aor[2] + aor[1])
//            playersScores[playerNumber - 1].scores[.threeOfKind] = totaValue
//        } else if aor[2] == aor[1] && aor [1] == aor[0] {
//            let totaValue = Double(aor[2] + aor[1] + aor[0])
//            playersScores[playerNumber - 1].scores[.threeOfKind] = totaValue
//        } else {
//            playersScores[playerNumber - 1].scores[.threeOfKind] = 0
//        }
//        print(playersScores[playerNumber - 1].scores[.threeOfKind] as Any)
//    }
//    
//    func saveAsSmallStraight(for playerNumber: Int) {
//        var aor: [Int] = []
//        for dice in dices {
//            aor.append(dice.value)
//        }
//        
//        if aor.contains(1) && aor.contains(2) && aor.contains(3) && aor.contains(4) && aor.contains(5) {
//            playersScores[playerNumber - 1].scores[.smallStraight] = 15
//        } else {
//            playersScores[playerNumber - 1].scores[.smallStraight] = 0
//        }
//        print(playersScores[playerNumber - 1].scores[.smallStraight] as Any)
//    }
//    
//    func saveAsBigStraight(for playerNumber: Int) {
//        var aor: [Int] = []
//        for dice in dices {
//            aor.append(dice.value)
//        }
//        
//        if aor.contains(6) && aor.contains(2) && aor.contains(3) && aor.contains(4) && aor.contains(5) {
//            playersScores[playerNumber - 1].scores[.bigStraight] = 20
//        } else {
//            playersScores[playerNumber - 1].scores[.bigStraight] = 0
//            
//        }
//        print(playersScores[playerNumber - 1].scores[.bigStraight] as Any)
//    }
//    
//    func saveAsFull(for playerNumber: Int) {
//        var aor: [Int] = []
//        for dice in dices {
//            aor.append(dice.value)
//        }
//        aor.sort()
//        
//        if aor[4] == aor[3] && aor[3] == aor[2] && aor[1] == aor[0] {
//            playersScores[playerNumber - 1].scores[.full] = Double(aor.reduce(0, +))
//        } else if aor[2] == aor[1] && aor[2] == aor[1] && aor[4] == aor[3] {
//            playersScores[playerNumber - 1].scores[.full] = Double(aor.reduce(0, +))
//        } else {
//            playersScores[playerNumber - 1].scores[.full] = 0
//        }
//        print(playersScores[playerNumber - 1].scores[.full] as Any)
//    }
//    
//    func saveAsFourOfKind(for playerNumber: Int) {
//        var aor: [Int] = []
//        for dice in dices {
//            aor.append(dice.value)
//        }
//        aor.sort()
//        
//        if aor[4] == aor[3] && aor[4] == aor[2] && aor[4] == aor[1] {
//            playersScores[playerNumber - 1].scores[.fourOfKind] = Double(aor[4] + aor[3] + aor[2] + aor[1])
//        } else if aor[0] == aor[1] && aor[0] == aor[2] && aor[0] == aor[3] {
//            playersScores[playerNumber - 1].scores[.fourOfKind] = Double(aor[0] + aor[1] + aor[2] + aor[3])
//        } else {
//            playersScores[playerNumber - 1].scores[.fourOfKind] = 0
//        }
//        
//        print(playersScores[playerNumber - 1].scores[.fourOfKind] as Any)
//    }
//    
//    func saveAsFiveOfKind(for playerNumber: Int) {
//        var aor: [Int] = []
//        for dice in dices {
//            aor.append(dice.value)
//        }
//        aor.sort()
//        
//        if aor[4] == aor[3] && aor[4] == aor[2] && aor[4] == aor[1] && aor[4] == aor[0] {
//            playersScores[playerNumber - 1].scores[.fiveOfKind] = 50
//        } else {
//            playersScores[playerNumber - 1].scores[.fiveOfKind] = 0
//        }
//        
//        print(playersScores[playerNumber - 1].scores[.fiveOfKind] as Any)
//    }
//
//    
//    func saveAsChanse(for playerNumber: Int) {
//        var totalValue = 0.0
//        for dice in dices {
//            totalValue += Double(dice.value)
//        }
//        self.playersScores[playerNumber - 1].scores[.chanse] = totalValue
//        print(playersScores[playerNumber - 1].scores[.chanse] as Any)
//    }
    
    
//    func checkIfTheGameIsOver(playerScore: PlayerScore) -> Bool {
//        if playerScore.scores[.ones] != 0.01 &&
//            playerScore.scores[.twos] != 0.01 &&
//            playerScore.scores[.threes] != 0.01 &&
//            playerScore.scores[.fours] != 0.01 &&
//            playerScore.scores[.fives] != 0.01 &&
//            playerScore.scores[.sixes] != 0.01 &&
//            playerScore.scores[.pair] != 0.01 &&
//            playerScore.scores[.twoPairs] != 0.01 &&
//            playerScore.scores[.threeOfKind] != 0.01 &&
//            playerScore.scores[.smallStraight] != 0.01 &&
//            playerScore.scores[.bigStraight] != 0.01 &&
//            playerScore.scores[.full] != 0.01 &&
//            playerScore.scores[.fourOfKind] != 0.01 &&
//            playerScore.scores[.fiveOfKind] != 0.01 &&
//            playerScore.scores[.chanse] != 0.01
//        {
//            self.createPlayerRanking()
//            return true
//        } else {
//            return false
//        }
//    }
//
//    
//    init() {
//        for _ in 1...5 {
//            let number = Int.random(in: 1...6)
//            let dice = Dice(value: number)
//            dices.append(dice)
//        }
        
//        let player1score = PlayerScore()
//        let player2score = PlayerScore()
//        playersScores.append(player1score)
////        playersScores.append(player2score)
//    }
}
