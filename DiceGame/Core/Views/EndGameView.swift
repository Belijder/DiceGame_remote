//
//  EndGameView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 03/01/2022.
//

import SwiftUI

struct EndGameView: View {
    
    @ObservedObject var vm: GameViewModel
    
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

                
                Text(vm.gameManager.ranking[0].0)
                    .foregroundColor(K.Colors.yellow)
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Spacer()
                
                Text("Final results:")
                    .font(.title)
                    .foregroundColor(K.Colors.yellow)
                    .fontWeight(.black)
                
                VStack {
                    ForEach(0..<vm.gameManager.playersScores.count, id: \.self) { index in
                        HStack {
                            Text(vm.gameManager.ranking[index].0)
                                .frame(width: 150, alignment: .leading)
                            Text("\(vm.gameManager.ranking[index].1)")
                        }
                        .foregroundColor(K.Colors.yellow)
                        .font(.title3)
                        
                    }
                }
                
                Spacer()
                
                Button {
                    vm.gameManager.prepareNewGame()
                } label: {
                    Text("Play Again")
                        .font(.title)
                        .foregroundColor(K.Colors.darkViolet)
                        .frame(width: 170, height: 50)
                        .background(K.Colors.yellow)
                        .clipShape(Capsule())
                        .padding()
                }
            }
            
                
        }.onAppear {
            vm.gameManager.gameIsInProgress = false
        }

    }
    
    init(vm: GameViewModel) {
        self.vm = vm
    }
    
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView(vm: GameViewModel(gameManager: GameManager()))
    }
}
