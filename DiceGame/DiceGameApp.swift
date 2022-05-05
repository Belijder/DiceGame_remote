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
            GameView(gameManager: gameManager)
            
//            Group {
//                if gameManager.gameIsInProgress {
//                    GameView()
//
//                } else {
//                    StartGameView()
//                }
//            }
        }
        
    }
    
    init() {
        _gameManager = StateObject(wrappedValue: GameManager())
    }
}
