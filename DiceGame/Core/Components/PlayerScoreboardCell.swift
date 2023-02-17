//
//  ScoreboardView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 06/01/2022.
//

import SwiftUI

struct PlayerScoreboardCell: View {
    
    @ObservedObject var vm: GameViewModel
    
    let playerNumber: Int
    
    
    var body: some View {
        
        let scores = vm.gameManager.playersScores[playerNumber - 1].scores
        
        return VStack {
            Group {
                Text("P\(playerNumber)")
                    .fontWeight(.bold)
                    .frame(width: 40, height: 30)
                    .foregroundColor(K.Colors.darkViolet)
                    .font(.title2)
                    .padding(4)
                    .border(K.Colors.darkViolet, width: 0.5)
                
                if let score = scores[.ones]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                
                if let score = scores[.twos]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.threes]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.fours]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.fives]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.sixes]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let bonus = vm.gameManager.playersScores[playerNumber - 1].bonus {
                    Text("\(bonus)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                
                Text("\(vm.gameManager.playersScores[playerNumber - 1].pointsRemainingToGetBonus)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                
            }
            Group {
                if let score = scores[.pair]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.twoPairs]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.threeOfKind]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.smallStraight]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.bigStraight]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.full]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.fourOfKind]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.fiveOfKind]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if let score = scores[.chanse]! {
                    Text("\(score)")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                Text("\(vm.gameManager.calculateTotalResult(forPlayer: playerNumber))")
                    .scoreboardScoreStyle()
            }
        }
    }
    
    init(vm: GameViewModel, playerNumber: Int) {
        self.vm = vm
        self.playerNumber = playerNumber
    }
}
        


struct ScoreboardScore: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 40, height: 25)
            .foregroundColor(K.Colors.darkViolet)
            .font(.title2)
            .padding(4)
            .border(K.Colors.darkViolet, width: 0.5)
            
    }
}

extension View {
    func scoreboardScoreStyle() -> some View {
        modifier(ScoreboardScore())
    }
}

struct PlayerScoreboardCell_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScoreboardCell(vm: GameViewModel(gameManager: GameManager()), playerNumber: 1)
    }
}


