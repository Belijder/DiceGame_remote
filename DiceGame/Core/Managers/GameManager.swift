//
//  GameManager.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 03/05/2022.
//

import Foundation

class GameManager: ObservableObject {
    
    @Published var dices = [Dice]()
    @Published var playersScores = [PlayerScore]()
    @Published var currentNumberOfdiceRolls = 0
    @Published var currentPlayer = 1
    @Published var gameIsEnded = false
    @Published var gameIsInProgress = false
    @Published var isActivPlayerAt = [false, false, false, false]
    
    @Published var ranking: [(String, Int)] = []
    
    enum Combinations {
        case ones, twos, threes, fours, fives, sixes, pair, twoPairs, threeOfKind, smallStraight, bigStraight, full, fourOfKind, fiveOfKind, chanse
    }
    
    init() {
        prepareNewGame()
    }
    
    func prepareNewGame() {
        
        if dices.isEmpty {
            for _ in 1...5 {
                let number = Int.random(in: 1...6)
                let dice = Dice(value: number)
                dices.append(dice)
            }
        }
        currentNumberOfdiceRolls = 0
        currentPlayer = 1
        gameIsEnded = false
        gameIsInProgress = false
        isActivPlayerAt = [false, false, false, false]
        playersScores = []
    }
    
    func roll() {
        if currentNumberOfdiceRolls > 0 {
            guard dices.contains(where: { $0.isblocked == false }) else { return }
        }
        for number in 0...4 {
            if dices[number].isblocked == false {
                dices[number].rollDice()
            }
        }
        for number in 0...4 {
            dices[number].isblocked = true
        }
        currentNumberOfdiceRolls += 1
    }
    
    func changePlayer() {
        if checkIfTheGameIsOver(playerScore: playersScores[playersScores.count - 1]) {
            gameIsEnded = true
        } else {
            if currentPlayer == playersScores.count {
                currentPlayer = 1
            } else {
                currentPlayer += 1
            }
            currentNumberOfdiceRolls = 0
            for number in 0...4 {
                dices[number].isblocked = false
            }
        }
    }
    
    
    func calculateTotalResult(forPlayer playerNumber: Int) -> Int {
        let result = playersScores[playerNumber - 1].scores.map() { $0.value ?? 0 }.reduce(0, +)
        let bonus = playersScores[playerNumber - 1].bonus ?? 0
        return result + bonus
    }
    
    func addPlayer() {
        let newPlayer = PlayerScore(playerNumber: playersScores.count + 1)
        playersScores.append(newPlayer)
        print(newPlayer.id)
    }
    
    func removePlayer(at index: Int) {
        playersScores.remove(at: index)
    }
    
    
    func createPlayerRanking() {
        var ranking: [String: Int] = [:]
        for number in 0..<playersScores.count {
            ranking.updateValue(calculateTotalResult(forPlayer: number + 1), forKey: playersScores[number].playerName)
        }
        let sortedRanking = ranking.sorted { $0.1 > $1.1 }
        self.ranking = sortedRanking
    }
    

    func makeSortedArrayOfDicesResults() -> [Int] {
        var aor: [Int] = []
        for dice in dices {
            aor.append(dice.value)
        }
        aor.sort()
        return aor
    }
    
    func calculatePossiblePointValueToSaveAsOnes() -> Int {
        var countDices = 0
        for dice in dices {
            if dice.value == 1 {
                countDices += 1
            }
        }
        return countDices * 1
    }
    
    func calculatePossiblePointValueToSaveAsTwos() -> Int {
        var countDices = 0
        for dice in dices {
            if dice.value == 2 {
                countDices += 1
            }
        }
        return countDices * 2
    }
    
    func calculatePossiblePointValueToSaveAsThrees() -> Int {
        var countDices = 0
        for dice in dices {
            if dice.value == 3 {
                countDices += 1
            }
        }
        return countDices * 3
    }
    
    func calculatePossiblePointValueToSaveAsFours() -> Int {
        var countDices = 0
        for dice in dices {
            if dice.value == 4 {
                countDices += 1
            }
        }
        return countDices * 4
    }
    
    func calculatePossiblePointValueToSaveAsFives() -> Int {
        var countDices = 0
        for dice in dices {
            if dice.value == 5 {
                countDices += 1
            }
        }
        return countDices * 5
    }
    
    func calculatePossiblePointValueToSaveAsSixes() -> Int {
        var countDices = 0
        for dice in dices {
            if dice.value == 6 {
                countDices += 1
            }
        }
        return countDices * 6
    }

    func calculatePossiblePointValueToSaveAsPair() -> Int {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] {
            return aor[4] + aor[3]
        } else if aor[3] == aor[2] {
            return aor[3] + aor[2]
        } else if aor[2] == aor[1] {
            return aor[2] + aor[1]
        } else if aor[1] == aor[0] {
            return aor[1] + aor[0]
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsTwoPairs() -> Int {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] && aor[2] == aor[1] {
            return aor[4] + aor[3] + aor[2] + aor[1]
        } else if aor[4] == aor[3] && aor[1] == aor[0] {
            return aor[4] + aor[3] + aor[1] + aor[0]
        } else if aor[3] == aor[2] && aor[1] == aor[0] {
            return  aor[3] + aor[2] + aor[1] + aor[0]
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsThreeOfKind() -> Int {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] && aor [3] == aor[2] {
            return aor[4] + aor[3] + aor[2]
        } else if aor[3] == aor[2] && aor [2] == aor[1] {
            return aor[3] + aor[2] + aor[1]

        } else if aor[2] == aor[1] && aor [1] == aor[0] {
            return aor[2] + aor[1] + aor[0]
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsSmallStraight() -> Int {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor.contains(1) && aor.contains(2) && aor.contains(3) && aor.contains(4) && aor.contains(5) {
            return 15
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsBigStraight() -> Int {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor.contains(6) && aor.contains(2) && aor.contains(3) && aor.contains(4) && aor.contains(5) {
            return 20
        } else {
            return 0
            
        }
    }
    
    func calculatePossiblePointValueToSaveAsFull() -> Int {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] && aor[3] == aor[2] && aor[1] == aor[0] {
            return aor.reduce(0, +)
        } else if aor[2] == aor[1] && aor[0] == aor[1] && aor[4] == aor[3] {
            return aor.reduce(0, +)
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsFourOfKind() -> Int {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] && aor[4] == aor[2] && aor[4] == aor[1] {
            return aor[4] + aor[3] + aor[2] + aor[1]
        } else if aor[0] == aor[1] && aor[0] == aor[2] && aor[0] == aor[3] {
            return aor[0] + aor[1] + aor[2] + aor[3]
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsFiveOfKind() -> Int {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] && aor[4] == aor[2] && aor[4] == aor[1] && aor[4] == aor[0] {
            return 50
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsChanse() -> Int  {
        let aor = makeSortedArrayOfDicesResults()
        return aor.reduce(0, +)
    }
    
    func saveAs(_ combinations: Combinations, for playerNumber: Int) {
        switch combinations {
        case .ones:
            self.playersScores[playerNumber - 1].scores[.ones] = calculatePossiblePointValueToSaveAsOnes()
        case .twos:
            self.playersScores[playerNumber - 1].scores[.twos] = calculatePossiblePointValueToSaveAsTwos()
        case .threes:
            self.playersScores[playerNumber - 1].scores[.threes] = calculatePossiblePointValueToSaveAsThrees()
        case .fours:
            self.playersScores[playerNumber - 1].scores[.fours] = calculatePossiblePointValueToSaveAsFours()
        case .fives:
            self.playersScores[playerNumber - 1].scores[.fives] = calculatePossiblePointValueToSaveAsFives()
        case .sixes:
            self.playersScores[playerNumber - 1].scores[.sixes] = calculatePossiblePointValueToSaveAsSixes()
        case .pair:
            self.playersScores[playerNumber - 1].scores[.pair] = calculatePossiblePointValueToSaveAsPair()
        case .twoPairs:
            self.playersScores[playerNumber - 1].scores[.twoPairs] = calculatePossiblePointValueToSaveAsTwoPairs()
        case .threeOfKind:
            self.playersScores[playerNumber - 1].scores[.threeOfKind] = calculatePossiblePointValueToSaveAsThreeOfKind()
        case .smallStraight:
            self.playersScores[playerNumber - 1].scores[.smallStraight] = calculatePossiblePointValueToSaveAsSmallStraight()
        case .bigStraight:
            self.playersScores[playerNumber - 1].scores[.bigStraight] = calculatePossiblePointValueToSaveAsBigStraight()
        case .full:
            self.playersScores[playerNumber - 1].scores[.full] = calculatePossiblePointValueToSaveAsFull()
        case .fourOfKind:
            self.playersScores[playerNumber - 1].scores[.fourOfKind] = calculatePossiblePointValueToSaveAsFourOfKind()
        case .fiveOfKind:
            self.playersScores[playerNumber - 1].scores[.fiveOfKind] = calculatePossiblePointValueToSaveAsFiveOfKind()
        case .chanse:
            self.playersScores[playerNumber - 1].scores[.chanse] = calculatePossiblePointValueToSaveAsChanse()
        }
        calculateBonus(for: playerNumber)
    }
    
    func calculateBonus(for playerNumber: Int) {
        let scores = [
            playersScores[playerNumber - 1].scores[.ones],
            playersScores[playerNumber - 1].scores[.twos],
            playersScores[playerNumber - 1].scores[.threes],
            playersScores[playerNumber - 1].scores[.fours],
            playersScores[playerNumber - 1].scores[.fives],
            playersScores[playerNumber - 1].scores[.sixes],
        ]
        let sum = scores.map { $0! ?? 0 }.reduce(0, +)
        if sum >= 63 {
            playersScores[playerNumber - 1].bonus = 25
        } else {
            playersScores[playerNumber - 1].pointsRemainingToGetBonus = 63 - sum
        }
    }

    func checkIfTheGameIsOver(playerScore: PlayerScore) -> Bool {
        if playerScore.scores[.ones]! != nil
//            &&
//            playerScore.scores[.twos]! != nil &&
//            playerScore.scores[.threes]! != nil &&
//            playerScore.scores[.fours]! != nil &&
//            playerScore.scores[.fives]! != nil &&
//            playerScore.scores[.sixes]! != nil &&
//            playerScore.scores[.pair]! != nil &&
//            playerScore.scores[.twoPairs]! != nil &&
//            playerScore.scores[.threeOfKind]! != nil &&
//            playerScore.scores[.smallStraight]! != nil &&
//            playerScore.scores[.bigStraight]! != nil &&
//            playerScore.scores[.full]! != nil &&
//            playerScore.scores[.fourOfKind]! != nil &&
//            playerScore.scores[.fiveOfKind]! != nil &&
//            playerScore.scores[.chanse]! != nil
        {
            self.createPlayerRanking()
            return true
        } else {
            return false
        }
    }
}
