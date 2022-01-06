//
//  ContentViewVM.swift
//  DiceGame
//
//  Created by Jakub Zajda on 19/12/2021.
//

import Foundation
import SwiftUI

class ContentViewVM: ObservableObject {
    var diceImages = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @Published var dices = [Dice]()
    
    @Published var playersScores = [PlayerScore]()
    
    @Published var currentNumberOfdiceRolls = 0
    
    @Published var currentPlayer = 1
    
    @Published var gameIsEnded = false
    
    func roll() {
        for number in 0...4 {
            if dices[number].isblocked == false {
                dices[number].rollDice()
            }
        }
        for number in 0...4 {
            dices[number].isblocked = false
        
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
        }
        
    }
    
    
    func calculateTotalResult(forPlayer playerNumber: Int) -> Int {
       let result = playersScores[playerNumber - 1].ones +
        playersScores[playerNumber - 1].twos +
        playersScores[playerNumber - 1].threes +
        playersScores[playerNumber - 1].fours +
        playersScores[playerNumber - 1].fives +
        playersScores[playerNumber - 1].sixes +
        playersScores[playerNumber - 1].pair +
        playersScores[playerNumber - 1].twoPairs +
        playersScores[playerNumber - 1].threeOfKind +
        playersScores[playerNumber - 1].smallStraight +
        playersScores[playerNumber - 1].bigStraight +
        playersScores[playerNumber - 1].full +
        playersScores[playerNumber - 1].fourOfKind +
        playersScores[playerNumber - 1].fiveOfKind +
        playersScores[playerNumber - 1].chanse
        
        let resultAsInt = Int(result)
        return resultAsInt
    
    }
    
    func saveAsOnes(for playerNumer: Int) {
        var totalValue = 0.0
        var countDices = 0
        
        for dice in dices {
            if dice.value == 1 {
                countDices += 1
            }
        }
        
        totalValue = Double(countDices * 1)
        self.playersScores[playerNumer - 1].ones = totalValue
        print(playersScores[playerNumer - 1].ones)
        print("Total result: \(calculateTotalResult(forPlayer: 1))")
    }
    
    func saveAsTwos(for playerNumer: Int) {
        var totalValue = 0.0
        var countDices = 0
        
        for dice in dices {
            if dice.value == 2 {
                countDices += 1
            }
        }
        
        totalValue = Double(countDices * 2)
        self.playersScores[playerNumer - 1].twos = totalValue
        print(playersScores[playerNumer - 1].twos)
    }
    
    func saveAsThrees(for playerNumer: Int) {
        var totalValue = 0.0
        var countDices = 0
        
        for dice in dices {
            if dice.value == 3 {
                countDices += 1
            }
        }
        
        totalValue = Double(countDices * 3)
        self.playersScores[playerNumer - 1].threes = totalValue
        print(playersScores[playerNumer - 1].threes)
    }
    
    func saveAsFours(for playerNumer: Int) {
        var totalValue = 0.0
        var countDices = 0
        
        for dice in dices {
            if dice.value == 4 {
                countDices += 1
            }
        }
        
        totalValue = Double(countDices * 4)
        self.playersScores[playerNumer - 1].fours = totalValue
        print(playersScores[playerNumer - 1].fours)
    }
    
    func saveAsFives(for playerNumer: Int) {
        var totalValue = 0.0
        var countDices = 0
        
        for dice in dices {
            if dice.value == 5 {
                countDices += 1
            }
        }
        
        totalValue = Double(countDices * 5)
        self.playersScores[playerNumer - 1].fives = totalValue
        print(playersScores[playerNumer - 1].fives)
    }
    
    func saveAsSixes(for playerNumer: Int) {
        var totalValue = 0.0
        var countDices = 0
        
        for dice in dices {
            if dice.value == 6 {
                countDices += 1
            }
        }
        
        totalValue = Double(countDices * 6)
        self.playersScores[playerNumer - 1].sixes = totalValue
        print(playersScores[playerNumer - 1].sixes)
    }
    
    func saveAsPair(for playerNumer: Int) {
        var aor: [Int] = []
        for dice in dices {
            aor.append(dice.value)
        }
        aor.sort()
        
        if aor[4] == aor[3] {
            playersScores[playerNumer - 1].pair = Double(aor[4] + aor[3])
        } else if aor[3] == aor[2] {
            playersScores[playerNumer - 1].pair = Double(aor[3] + aor[2])
        } else if aor[2] == aor[1] {
            playersScores[playerNumer - 1].pair = Double(aor[2] + aor[1])
        } else if aor[1] == aor[0] {
            playersScores[playerNumer - 1].pair = Double(aor[1] + aor[0])
        } else {
            playersScores[playerNumer - 1].pair = 0
        }
        
        print(playersScores[playerNumer - 1].pair)
    }
    
    func saveAsTwoPairs(for playerNumer: Int) {
        var aor: [Int] = []
        for dice in dices {
            aor.append(dice.value)
        }
        aor.sort()
        
        if aor[4] == aor[3] && aor[2] == aor[1] {
            let totalValue = Double(aor[4] + aor[3] + aor[2] + aor[1])
            playersScores[playerNumer - 1].twoPairs = totalValue
        } else if aor[4] == aor[3] && aor[1] == aor[0] {
            let totalValue = Double(aor[4] + aor[3] + aor[1] + aor[0])
            playersScores[playerNumer - 1].twoPairs = totalValue
        } else if aor[3] == aor[2] && aor[1] == aor[0] {
            let totalValue = Double(aor[3] + aor[2] + aor[1] + aor[0])
            playersScores[playerNumer - 1].twoPairs = totalValue
        } else {
            playersScores[playerNumer - 1].twoPairs = 0
        }
        print(playersScores[playerNumer - 1].twoPairs)
    }
    
    func saveAsThreeOfKind(for playerNumer: Int) {
        var aor: [Int] = []
        for dice in dices {
            aor.append(dice.value)
        }
        aor.sort()
        
        if aor[4] == aor[3] && aor [3] == aor[2] {
            let totaValue = Double(aor[4] + aor[3] + aor[2])
            playersScores[playerNumer - 1].threeOfKind = totaValue
        } else if aor[3] == aor[2] && aor [2] == aor[1] {
            let totaValue = Double(aor[3] + aor[2] + aor[1])
            playersScores[playerNumer - 1].threeOfKind = totaValue
        } else if aor[2] == aor[1] && aor [1] == aor[0] {
            let totaValue = Double(aor[2] + aor[1] + aor[0])
            playersScores[playerNumer - 1].threeOfKind = totaValue
        } else {
            playersScores[playerNumer - 1].threeOfKind = 0
        }
        print(playersScores[playerNumer - 1].threeOfKind)
    }
    
    func saveAsSmallStraight(for playerNumer: Int) {
        var aor: [Int] = []
        for dice in dices {
            aor.append(dice.value)
        }
        
        if aor.contains(1) && aor.contains(2) && aor.contains(3) && aor.contains(4) && aor.contains(5) {
            playersScores[playerNumer - 1].smallStraight = 15
        } else {
            playersScores[playerNumer - 1].smallStraight = 0
        }
        print(playersScores[playerNumer - 1].smallStraight)
    }
    
    func saveAsBigStraight(for playerNumer: Int) {
        var aor: [Int] = []
        for dice in dices {
            aor.append(dice.value)
        }
        
        if aor.contains(6) && aor.contains(2) && aor.contains(3) && aor.contains(4) && aor.contains(5) {
            playersScores[playerNumer - 1].bigStraight = 20
        } else {
            playersScores[playerNumer - 1].bigStraight = 0
            
        }
        print(playersScores[playerNumer - 1].bigStraight)
    }
    
    func saveAsFull(for playerNumer: Int) {
        var aor: [Int] = []
        for dice in dices {
            aor.append(dice.value)
        }
        aor.sort()
        
        if aor[4] == aor[3] && aor[3] == aor[2] && aor[1] == aor[0] {
            playersScores[playerNumer - 1].full = Double(aor.reduce(0, +))
        } else if aor[2] == aor[1] && aor[2] == aor[1] && aor[4] == aor[3] {
            playersScores[playerNumer - 1].full = Double(aor.reduce(0, +))
        } else {
            playersScores[playerNumer - 1].full = 0
        }
        print(playersScores[playerNumer - 1].full)
    }
    
    func saveAsFourOfKind(for playerNumer: Int) {
        var aor: [Int] = []
        for dice in dices {
            aor.append(dice.value)
        }
        aor.sort()
        
        if aor[4] == aor[3] && aor[4] == aor[2] && aor[4] == aor[1] {
            playersScores[playerNumer - 1].fourOfKind = Double(aor[4] + aor[3] + aor[2] + aor[1])
        } else if aor[0] == aor[1] && aor[0] == aor[2] && aor[0] == aor[3] {
            playersScores[playerNumer - 1].fourOfKind = Double(aor[0] + aor[1] + aor[2] + aor[3])
        } else {
            playersScores[playerNumer - 1].fourOfKind = 0
        }
        
        print(playersScores[playerNumer - 1].fourOfKind)
    }
    
    func saveAsFiveOfKind(for playerNumer: Int) {
        var aor: [Int] = []
        for dice in dices {
            aor.append(dice.value)
        }
        aor.sort()
        
        if aor[4] == aor[3] && aor[4] == aor[2] && aor[4] == aor[1] && aor[4] == aor[0] {
            playersScores[playerNumer - 1].fiveOfKind = 50
        } else {
            playersScores[playerNumer - 1].fiveOfKind = 0
        }
        
        print(playersScores[playerNumer - 1].fiveOfKind)
    }

    
    func saveAsChanse(for playerNumer: Int) {
        var totalValue = 0.0
        for dice in dices {
            totalValue += Double(dice.value)
        }
        self.playersScores[playerNumer - 1].chanse = totalValue
        print(playersScores[playerNumer - 1].chanse)
    }
    
    
    func checkIfTheGameIsOver(playerScore: PlayerScore) -> Bool {
        if playerScore.ones != 0.01 //&&
//            playerScore.twos != 0.01 &&
//            playerScore.threes != 0.01 &&
//            playerScore.fours != 0.01 &&
//            playerScore.fives != 0.01 &&
//            playerScore.sixes != 0.01 &&
//            playerScore.pair != 0.01 &&
//            playerScore.twoPairs != 0.01 &&
//            playerScore.threeOfKind != 0.01 &&
//            playerScore.smallStraight != 0.01 &&
//            playerScore.bigStraight != 0.01 &&
//            playerScore.full != 0.01 &&
//            playerScore.fourOfKind != 0.01 &&
//            playerScore.fiveOfKind != 0.01 &&
//            playerScore.chanse != 0.01
        {
            return true
        } else {
            return false
        }
    }

    
    init() {
        for _ in 1...5 {
            let number = Int.random(in: 1...6)
            let dice = Dice(value: number, image: diceImages[number - 1])
            dices.append(dice)
        }
        
        let player1score = PlayerScore()
        let player2score = PlayerScore()
        playersScores.append(player1score)
        playersScores.append(player2score)
    }
}
