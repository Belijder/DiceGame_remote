//
//  ScoresView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 06/01/2022.
//

import SwiftUI

struct ScoresView: View {
    
    @EnvironmentObject var VM: GameViewVM
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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
                    TitlesScoreboardView()
                    ForEach(1..<VM.playersScores.count + 1) { number in
                        PlayerScoreboardView(playerNumber: number)
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
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(K.Colors.darkViolet)
                            .clipShape(Circle())
                    }.padding()
                    Spacer()
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
