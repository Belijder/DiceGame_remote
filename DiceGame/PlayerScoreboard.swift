//
//  ScoreboardView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 06/01/2022.
//

import SwiftUI

struct PlayerScoreboardView: View {
    
    @EnvironmentObject var VM: GameViewVM
    
    let playerNumber: Int
    
    
    var body: some View {
        
        let scores = VM.playersScores[playerNumber - 1].scores
        
        return VStack {
            Group {
                Text("P\(playerNumber)")
                    .fontWeight(.bold)
                    .frame(width: 40, height: 30)
                    .foregroundColor(K.Colors.darkViolet)
                    .font(.title2)
                    .padding(4)
                    .border(K.Colors.darkViolet, width: 0.5)
                
                if scores[.ones] != 0.01 {
                    Text("\(Int(scores[.ones]!))")
                        .scoreboardScoreStyle()
                    
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if scores[.twos] != 0.01 {
                    Text("\(Int(scores[.twos]!))")
                        .scoreboardScoreStyle()
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if scores[.threes] != 0.01 {
                    Text("\(Int(scores[.threes]!))")
                        .scoreboardScoreStyle()
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if scores[.fours] != 0.01 {
                    Text("\(Int(scores[.fours]!))")
                        .scoreboardScoreStyle()
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if scores[.fives] != 0.01 {
                    Text("\(Int(scores[.fives]!))")
                        .scoreboardScoreStyle()
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
                if scores[.sixes] != 0.01 {
                    Text("\(Int(scores[.sixes]!))")
                        .scoreboardScoreStyle()
                } else {
                    Text("")
                        .scoreboardScoreStyle()
                }
            }
            Group {
            if scores[.pair] != 0.01 {
                Text("\(Int(scores[.pair]!))")
                    .scoreboardScoreStyle()
            } else {
                Text("")
                    .scoreboardScoreStyle()
            }
            if scores[.twoPairs] != 0.01 {
                Text("\(Int(scores[.twoPairs]!))")
                    .scoreboardScoreStyle()
            } else {
                Text("")
                    .scoreboardScoreStyle()
            }
            if scores[.threeOfKind] != 0.01 {
                Text("\(Int(scores[.threeOfKind]!))")
                    .scoreboardScoreStyle()
            } else {
                Text("")
                    .scoreboardScoreStyle()
            }
            if scores[.smallStraight] != 0.01 {
                Text("\(Int(scores[.smallStraight]!))")
                    .scoreboardScoreStyle()
            } else {
                Text("")
                    .scoreboardScoreStyle()
            }
            if scores[.bigStraight] != 0.01 {
                Text("\(Int(scores[.bigStraight]!))")
                    .scoreboardScoreStyle()
            } else {
                Text("")
                    .scoreboardScoreStyle()
            }
            if scores[.full] != 0.01 {
                Text("\(Int(scores[.full]!))")
                    .scoreboardScoreStyle()
            } else {
                Text("")
                    .scoreboardScoreStyle()
            }
            if scores[.fourOfKind] != 0.01 {
                Text("\(Int(scores[.fourOfKind]!))")
                    .scoreboardScoreStyle()
            } else {
                Text("")
                    .scoreboardScoreStyle()
            }
            if scores[.fiveOfKind] != 0.01 {
                Text("\(Int(scores[.fiveOfKind]!))")
                    .scoreboardScoreStyle()
            } else {
                Text("")
                    .scoreboardScoreStyle()
            }
            if scores[.chanse] != 0.01 {
                Text("\(Int(scores[.chanse]!))")
                    .scoreboardScoreStyle()
            } else {
                Text("")
                    .scoreboardScoreStyle()
            }
                Text("\(VM.calculateTotalResult(forPlayer: playerNumber))")
                    .scoreboardScoreStyle()
            }
            
        }

        
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

//struct ScoreboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerScoreboardView(playerNumber: 1)
//    }
//}


