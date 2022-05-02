//
//  Dice.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 19/12/2021.
//

import Foundation
import SwiftUI

struct Dice: Identifiable {
    let id = UUID()
    var value: Int
    var image: String
    var isblocked = true
    
    mutating func rollDice() {
        let number = Int.random(in: 1...6)
        value = number
        image = "dice\(number)"
        
    }
}
