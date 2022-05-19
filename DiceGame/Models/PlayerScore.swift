//
//  PlayerScore.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 19/12/2021.
//

import Foundation

struct PlayerScore: Identifiable, Codable, Hashable {
    
    enum Combinations: Codable {
        case ones, twos, threes, fours, fives, sixes, pair, twoPairs, threeOfKind, smallStraight, bigStraight, full, fourOfKind, fiveOfKind, chanse
    }
    
    var id = UUID()
    
    let playerNumber: Int
    
    var playerName = ""
    
    var isSelected = false
    
    var scores: [Combinations: Int?] = [
        .ones: nil,
        .twos: nil,
        .threes: nil,
        .fours: nil,
        .fives: nil,
        .sixes: nil,
        .pair: nil,
        .twoPairs: nil,
        .threeOfKind: nil,
        .smallStraight: nil,
        .bigStraight: nil,
        .full: nil,
        .fourOfKind: nil,
        .fiveOfKind: nil,
        .chanse: nil,
        ]
    
    var bonus: Int? = nil
    var pointsRemainingToGetBonus = 63
}
