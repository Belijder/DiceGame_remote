//
//  ScoresView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 06/01/2022.
//

import SwiftUI

struct ScoresView: View {
    
    @EnvironmentObject var VM: GameViewVM
    
    var body: some View {
        ZStack {
            K.Colors.lightViolet
                .ignoresSafeArea(.all)
            VStack {
                Text("Scores:")
                    .foregroundColor(K.Colors.darkViolet)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding()
                ScoreboardView()
                    .padding()
                Spacer()
                
            }
        }
        
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
    }
}
