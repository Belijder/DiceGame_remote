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
        let result = playersScores[playerNumber - 1].scores.map() { $0.value }.reduce(0, +)
        let resultAsInt = Int(result)
        return resultAsInt
    }
    
    func addPlayer() {
        let newPlayer = PlayerScore(playerNumber: playersScores.count + 1)
        playersScores.append(newPlayer)
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
    
    func startNewGame() {
        gameIsEnded = false
        playersScores = []
        isActivPlayerAt = [false, false, false, false]
        currentPlayer = 1
        currentNumberOfdiceRolls = 0
    }
    
    
    
    func makeSortedArrayOfDicesResults() -> [Int] {
        var aor: [Int] = []
        for dice in dices {
            aor.append(dice.value)
        }
        aor.sort()
        return aor
    }
    
    func calculatePossiblePointValueToSaveAsOnes() -> Double {
        var countDices = 0
        for dice in dices {
            if dice.value == 1 {
                countDices += 1
            }
        }
        return Double(countDices * 1)
    }
    
    func calculatePossiblePointValueToSaveAsTwos() -> Double {
        var countDices = 0
        for dice in dices {
            if dice.value == 2 {
                countDices += 1
            }
        }
        return Double(countDices * 2)
    }
    
    func calculatePossiblePointValueToSaveAsThrees() -> Double {
        var countDices = 0
        for dice in dices {
            if dice.value == 3 {
                countDices += 1
            }
        }
        return Double(countDices * 3)
    }
    
    func calculatePossiblePointValueToSaveAsFours() -> Double {
        var countDices = 0
        for dice in dices {
            if dice.value == 4 {
                countDices += 1
            }
        }
        return Double(countDices * 4)
    }
    
    func calculatePossiblePointValueToSaveAsFives() -> Double {
        var countDices = 0
        for dice in dices {
            if dice.value == 5 {
                countDices += 1
            }
        }
        return Double(countDices * 5)
    }
    
    func calculatePossiblePointValueToSaveAsSixes() -> Double {
        var countDices = 0
        for dice in dices {
            if dice.value == 6 {
                countDices += 1
            }
        }
        return Double(countDices * 6)
    }

    func calculatePossiblePointValueToSaveAsPair() -> Double {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] {
            return Double(aor[4] + aor[3])
        } else if aor[3] == aor[2] {
            return Double(aor[3] + aor[2])
        } else if aor[2] == aor[1] {
            return Double(aor[2] + aor[1])
        } else if aor[1] == aor[0] {
            return Double(aor[1] + aor[0])
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsTwoPairs() -> Double {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] && aor[2] == aor[1] {
            return Double(aor[4] + aor[3] + aor[2] + aor[1])
        } else if aor[4] == aor[3] && aor[1] == aor[0] {
            return Double(aor[4] + aor[3] + aor[1] + aor[0])
        } else if aor[3] == aor[2] && aor[1] == aor[0] {
            return  Double(aor[3] + aor[2] + aor[1] + aor[0])
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsThreeOfKind() -> Double {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] && aor [3] == aor[2] {
            return Double(aor[4] + aor[3] + aor[2])
        } else if aor[3] == aor[2] && aor [2] == aor[1] {
            return Double(aor[3] + aor[2] + aor[1])

        } else if aor[2] == aor[1] && aor [1] == aor[0] {
            return Double(aor[2] + aor[1] + aor[0])
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsSmallStraight() -> Double {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor.contains(1) && aor.contains(2) && aor.contains(3) && aor.contains(4) && aor.contains(5) {
            return 15
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsBigStraight() -> Double {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor.contains(6) && aor.contains(2) && aor.contains(3) && aor.contains(4) && aor.contains(5) {
            return 20
        } else {
            return 0
            
        }
    }
    
    func calculatePossiblePointValueToSaveAsFull() -> Double {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] && aor[3] == aor[2] && aor[1] == aor[0] {
            return Double(aor.reduce(0, +))
        } else if aor[2] == aor[1] && aor[0] == aor[1] && aor[4] == aor[3] {
            return Double(aor.reduce(0, +))
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsFourOfKind() -> Double {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] && aor[4] == aor[2] && aor[4] == aor[1] {
            return Double(aor[4] + aor[3] + aor[2] + aor[1])
        } else if aor[0] == aor[1] && aor[0] == aor[2] && aor[0] == aor[3] {
            return Double(aor[0] + aor[1] + aor[2] + aor[3])
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsFiveOfKind() -> Double {
        let aor = makeSortedArrayOfDicesResults()
        
        if aor[4] == aor[3] && aor[4] == aor[2] && aor[4] == aor[1] && aor[4] == aor[0] {
            return 50
        } else {
            return 0
        }
    }
    
    func calculatePossiblePointValueToSaveAsChanse() -> Double  {
        let aor = makeSortedArrayOfDicesResults()
        return Double(aor.reduce(0, +))
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
    }

    func checkIfTheGameIsOver(playerScore: PlayerScore) -> Bool {
        if playerScore.scores[.ones] != 0.01 &&
            playerScore.scores[.twos] != 0.01 &&
            playerScore.scores[.threes] != 0.01 &&
            playerScore.scores[.fours] != 0.01 &&
            playerScore.scores[.fives] != 0.01 &&
            playerScore.scores[.sixes] != 0.01 &&
            playerScore.scores[.pair] != 0.01 &&
            playerScore.scores[.twoPairs] != 0.01 &&
            playerScore.scores[.threeOfKind] != 0.01 &&
            playerScore.scores[.smallStraight] != 0.01 &&
            playerScore.scores[.bigStraight] != 0.01 &&
            playerScore.scores[.full] != 0.01 &&
            playerScore.scores[.fourOfKind] != 0.01 &&
            playerScore.scores[.fiveOfKind] != 0.01 &&
            playerScore.scores[.chanse] != 0.01
        {
            self.createPlayerRanking()
            return true
        } else {
            return false
        }
    }

    
    init() {
        for _ in 1...5 {
            let number = Int.random(in: 1...6)
            let dice = Dice(value: number)
            dices.append(dice)
        }
    }
}
