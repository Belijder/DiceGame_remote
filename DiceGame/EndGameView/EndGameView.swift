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
    @Environment(\.dismiss) var dismiss
    
    @State private var startNewGame = false
    
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

                
                Text(VM.ranking[0].0)
                    .foregroundColor(K.Colors.yellow)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Spacer()
                
                Text("Final results:")
                    .font(.title)
                    .foregroundColor(K.Colors.yellow)
                    .fontWeight(.black)
                
                VStack {
                    ForEach(0..<VM.playersScores.count) { index in
                        HStack {
                            Text(VM.ranking[index].0)
                                .frame(width: 150, alignment: .leading)
                            Text("\(VM.ranking[index].1)")
                        }
                        .foregroundColor(K.Colors.yellow)
                        .font(.title3)
                        
                    }
                }
                
                Spacer()
                
                Button {
                    let rootViewController = UIApplication.shared.connectedScenes
                            .filter {$0.activationState == .foregroundActive }
                            .map {$0 as? UIWindowScene }
                            .compactMap { $0 }
                            .first?.windows
                            .filter({ $0.isKeyWindow }).first?.rootViewController
                        
                        rootViewController?.dismiss(animated: true) {
                            VM.startNewGame()
                        }
                } label: {
                    Text("Play Again")
                        .font(.title)
                        .foregroundColor(K.Colors.darkViolet)
                        .frame(width: 170, height: 50)
                        .background(K.Colors.yellow)
                        .clipShape(Capsule())
                        .padding()
                }
                .fullScreenCover(isPresented: $startNewGame) {
                    StartGameView()
                }
            
            }
            
                
        }.onAppear {
            VM.gameIsInProgress = false
        }

    }
    
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
    }
}
