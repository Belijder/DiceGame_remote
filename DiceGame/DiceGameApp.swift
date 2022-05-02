//
//  DiceGameApp.swift
//  DiceGame
//
//  Created by Jakub Zajda on 19/12/2021.
//

import SwiftUI

@main
struct DiceGameApp: App {
    
    @StateObject var gameViewVM = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if gameViewVM.gameIsInProgress {
                    GameView()

                } else {
                    StartGameView()
                }
            }.environmentObject(gameViewVM)
        }
    }
}
