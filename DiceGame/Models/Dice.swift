//
//  Dice.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 19/12/2021.
//

import Foundation
import SwiftUI

struct Dice: Identifiable, Codable {
    var id = UUID()
    var value: Int
    var isblocked = true
    
    mutating func rollDice() {
        let number = Int.random(in: 1...6)
        value = number
    }
}
