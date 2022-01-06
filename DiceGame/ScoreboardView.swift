//
//  ScoreboardView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 06/01/2022.
//

import SwiftUI

struct ScoreboardView: View {
    
    @EnvironmentObject var VM: GameViewVM
    
    var body: some View {
        HStack {
            VStack {
                Group {
                    Text("")
                    Text("Ones").scoreboardTitle()
                    Text("Twos").scoreboardTitle()
                    Text("Threes").scoreboardTitle()
                    Text("Fours").scoreboardTitle()
                    Text("Fives").scoreboardTitle()
                    Text("Sixes").scoreboardTitle()
                }
                Text("Pair").scoreboardTitle()
                Text("Two Pairs").scoreboardTitle()
                Text("Three of a kind").scoreboardTitle()
                Text("Small Straight").scoreboardTitle()
                Text("Big Straight").scoreboardTitle()
                Text("Full").scoreboardTitle()
                Text("Four of a kind").scoreboardTitle()
                Text("Five of a kind").scoreboardTitle()
                Text("Chanse").scoreboardTitle()

            }
            ForEach(VM.playersScores) { player in
                Spacer()
                VStack {
                    Group {
                        Text("Player").scoreboardScore()
                        
                        if player.ones != 0.01 {
                            Text("\(player.ones)").scoreboardScore()
                        } else {
                            Text("").scoreboardScore()
                        }
                        
                        if player.twos != 0.01 {
                            Text("\(player.twos)").scoreboardScore()
                        } else {
                            Text("").scoreboardScore()
                        }
                        
                        if player.threes != 0.01 {
                            Text("\(player.threes)").scoreboardScore()
                        } else {
                            Text("").scoreboardScore()
                        }
                        
                        if player.fours != 0.01 {
                            Text("\(player.fours)").scoreboardScore()
                        } else {
                            Text("").scoreboardScore()
                        }
                        
                        if player.fives != 0.01 {
                            Text("\(player.fives)").scoreboardScore()
                        } else {
                            Text("").scoreboardScore()
                        }
                        
                        if player.sixes != 0.01 {
                            Text("\(player.sixes)").scoreboardScore()
                        } else {
                            Text("").scoreboardScore()
                        }
                    }
                    
                    if player.pair != 0.01 {
                        Text("\(player.pair)").scoreboardScore()
                    } else {
                        Text("").scoreboardScore()
                    }
                    
                    if player.twoPairs != 0.01 {
                        Text("\(player.twoPairs)").scoreboardScore()
                    } else {
                        Text("").scoreboardScore()
                    }
                    
                    if player.threeOfKind != 0.01 {
                        Text("\(player.threeOfKind)").scoreboardScore()
                    } else {
                        Text("").scoreboardScore()
                    }
                    
                    if player.smallStraight != 0.01 {
                        Text("\(player.smallStraight)").scoreboardScore()
                    } else {
                        Text("").scoreboardScore()
                    }
                    
                    if player.bigStraight != 0.01 {
                        Text("\(player.bigStraight)").scoreboardScore()
                    } else {
                        Text("").scoreboardScore()
                    }
                    
                    if player.full != 0.01 {
                        Text("\(player.full)").scoreboardScore()
                    } else {
                        Text("").scoreboardScore()
                    }
                    
                    if player.fourOfKind != 0.01 {
                        Text("\(player.fourOfKind)").scoreboardScore()
                    } else {
                        Text("").scoreboardScore()
                    }
                    
                    if player.fiveOfKind != 0.01 {
                        Text("\(player.fiveOfKind)").scoreboardScore()
                    } else {
                        Text("").scoreboardScore()
                    }
                    
                    if player.chanse != 0.01 {
                        Text("\(player.chanse)").scoreboardScore()
                    } else {
                        Text("").scoreboardScore()
                    }
                    
                }
                Spacer()
            }
        }
    }
}



extension Text {
    func scoreboardTitle() -> some View {
        self
            .foregroundColor(K.Colors.darkViolet)
            .font(.title3)
            .bold()
            .frame(width: 140, height: 30, alignment: .leading)
    }
}

extension Text {
    func scoreboardScore() -> some View {
        self
            .foregroundColor(K.Colors.darkViolet)
            .font(.title3)
            .bold()
            .frame(width: 60, height: 30, alignment: .leading)
    }
}

struct ScoreboardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreboardView()
    }
}


