//
//  TitlesScoreboardView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 09/01/2022.
//

import SwiftUI

struct TitlesScoreboardCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Group {
                    Text("")
                        .frame(width: 150, height: 30, alignment: .leading)
                        .foregroundColor(K.Colors.darkViolet)
                        .font(.title2)
                        .padding(4)
                    Text("Ones").scoreboardTitleStyle()
                    Text("Twos").scoreboardTitleStyle()
                    Text("Threes").scoreboardTitleStyle()
                    Text("Fours").scoreboardTitleStyle()
                    Text("Fives").scoreboardTitleStyle()
                    Text("Sixes").scoreboardTitleStyle()
                    Text("Bonus").scoreboardScoreStyle()
                }
                Group {
                    Text("Pair").scoreboardTitleStyle()
                    Text("Two Pairs").scoreboardTitleStyle()
                    Text("Three of a kind").scoreboardTitleStyle()
                    Text("Small Straight").scoreboardTitleStyle()
                    Text("Big Straight").scoreboardTitleStyle()
                    Text("Full").scoreboardTitleStyle()
                    Text("Four of a kind").scoreboardTitleStyle()
                    Text("Five of a kind").scoreboardTitleStyle()
                    Text("Chanse").scoreboardTitleStyle()
                    Text("Sum")
                        .fontWeight(.black)
                        .scoreboardTitleStyle()
                }
                
            }
        }
    }
}

struct ScoreboardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 150, height: 25, alignment: .leading)
            .foregroundColor(K.Colors.darkViolet)
            .font(.title3)
            .padding(4)
            .border(K.Colors.darkViolet, width: 0.5)
    }
}

extension View {
    func scoreboardTitleStyle() -> some View {
        modifier(ScoreboardTitle())
    }
}

struct TitlesScoreboardView_Previews: PreviewProvider {
    static var previews: some View {
        TitlesScoreboardCell()
    }
}
