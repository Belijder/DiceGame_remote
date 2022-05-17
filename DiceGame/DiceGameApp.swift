//
//  DiceGameApp.swift
//  DiceGame
//
//  Created by Jakub Zajda on 19/12/2021.
//

import SwiftUI

@main
struct DiceGameApp: App {
    
    @StateObject var gameManager: GameManager
    
    var body: some Scene {
        WindowGroup {
            StartGameView(gameManager: gameManager)
        }
        
    }
    
    init() {
        _gameManager = StateObject(wrappedValue: GameManager())
    }
}
