//
//  ProgressModel.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 19/05/2022.
//

import Foundation

struct ProgressModel: Codable {
    var dices: [Dice]
    var playersScores: [PlayerScore]
    var currentPlayer: Int
    var currentNumberOfdiceRolls: Int
    var gameIsEnded: Bool
    var gameIsInProgress: Bool
    var isActivPlayerAt: [Bool]
}
