//
//  PlayerScore.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 19/12/2021.
//

import Foundation

struct PlayerScore: Identifiable, Hashable {
    
    enum Combinations {
        case ones, twos, threes, fours, fives, sixes, pair, twoPairs, threeOfKind, smallStraight, bigStraight, full, fourOfKind, fiveOfKind, chanse
    }
    
    let id = UUID()
    
    let playerNumber: Int
    
    var playerName = " "
    
    var isSelected = false
    
//    var ones = 0.01
//    var twos = 0.01
//    var threes = 0.01
//    var fours = 0.01
//    var fives = 0.01
//    var sixes = 0.01
//
//    var pair = 0.01
//    var twoPairs = 0.01
//    var threeOfKind = 0.01
//    var smallStraight = 0.01
//    var bigStraight = 0.01
//    var full = 0.01
//    var fourOfKind = 0.01
//    var fiveOfKind = 0.01
//    var chanse = 0.01
    
    var scores: [Combinations: Double] = [
        .ones: 0.01,
        .twos: 0.01,
        .threes: 0.01,
        .fours: 0.01,
        .fives: 0.01,
        .sixes: 0.01,
        .pair: 0.01,
        .twoPairs: 0.01,
        .threeOfKind: 0.01,
        .smallStraight: 0.01,
        .bigStraight: 0.01,
        .full: 0.01,
        .fourOfKind: 0.01,
        .fiveOfKind: 0.01,
        .chanse: 0.01,
        ]
        
    
}
