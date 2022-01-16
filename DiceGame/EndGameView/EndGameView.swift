//
//  EndGameView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 03/01/2022.
//

import SwiftUI

struct EndGameView: View {
    
    @EnvironmentObject var VM: GameViewVM
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ZStack {
            K.Colors.darkViolet
                .ignoresSafeArea(.all)
            VStack {
                Text("Game Over")
                    .foregroundColor(K.Colors.yellow)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.7)
                    .padding(.vertical, 10)
                    .padding(.top, 20)
                
                Text("The winner is:")
                    .foregroundColor(K.Colors.yellow)
                    .font(.title)

                
                Text("Kamila")
                    .foregroundColor(K.Colors.yellow)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Spacer()
                
                
            }
            
            
            
            
            
                
        }

    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
    }
}
