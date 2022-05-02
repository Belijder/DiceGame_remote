//
//  ScoresView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 06/01/2022.
//

import SwiftUI

struct ScoresView: View {
    
    @EnvironmentObject var VM: GameViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                K.Colors.lightViolet
                    .ignoresSafeArea(.all)
                ScrollView {
                    Text("Scores")
                        .foregroundColor(K.Colors.darkViolet)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding()
                    HStack(alignment: .top) {
                        TitlesScoreboardCell()
                        ForEach(1..<VM.playersScores.count + 1, id:\.self) { number in
                            PlayerScoreboardCell(playerNumber: number)
                        }
                        
                    }
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(K.Colors.yellow)
                                .frame(width: geo.size.width * 0.30, height: geo.size.width * 0.33 / 2.5, alignment: .center)
                                .background(K.Colors.darkViolet)
                                .clipShape(Circle())
                        }.padding()
                        Spacer()
                    }
                }
            }
        }
        
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
    }
}
