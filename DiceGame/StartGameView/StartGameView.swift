//
//  StartGameView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 10/01/2022.
//

import SwiftUI

struct StartGameView: View {
    
    
    @EnvironmentObject var VM: GameViewVM
    
    @State var showGameView = false
    
    var disableStartButton: Bool {
        
        var returnValue = true
        
        if VM.playersScores.count == 0 {
            returnValue = true
        } else {
            returnValue = false
        }
    
        for number in 0..<VM.playersScores.count {
            if VM.playersScores[number].playerName == " " {
                returnValue = true
            } else {
                returnValue = false
            }
        }
        
        return returnValue
    }
    
//    let columns = [
//            GridItem(.flexible()),
//            GridItem(.flexible())
//        ]
    
    
    var body: some View {
        ZStack {
            K.Colors.lightViolet
                .ignoresSafeArea(.all)
            VStack {
                Text("Dice Game")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(K.Colors.darkViolet)
                    .padding(.top)
                Text("Start a new game")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(K.Colors.darkViolet)
                Spacer()
                
//                LazyVGrid(columns: columns) {
//                    ForEach(0..<4) { number in
//                        if number < VM.playersScores.count {
//                            PlayersSelectionsCell(player: VM.playersScores[number])
//                        } else {
//                            AddPlayerCell()
//                                .onTapGesture {
//                                    VM.addPlayer()
//                                }
//                        }
//                    }
//                }
                
                
                VStack {
                    HStack {
                        if VM.isActivPlayerAt[0] {
                            PlayersSelectionsCell(player: VM.playersScores[VM.playersScores.count - 1], positionInGrid: 1)
                        } else {
                            AddPlayerCell()
                                .onTapGesture {
                                    VM.addPlayer()
                                    VM.isActivPlayerAt[0] = true
                                }
                        }

                        if VM.isActivPlayerAt[1] {
                            PlayersSelectionsCell(player: VM.playersScores[VM.playersScores.count - 1], positionInGrid: 2)
                        } else {
                            AddPlayerCell()
                                .onTapGesture {
                                    VM.addPlayer()
                                    VM.isActivPlayerAt[1] = true
                                }
                        }

                    }

                    HStack {
                        if VM.isActivPlayerAt[2] {
                            PlayersSelectionsCell(player: VM.playersScores[VM.playersScores.count - 1], positionInGrid: 3)
                        } else {
                            AddPlayerCell()
                                .onTapGesture {
                                    VM.addPlayer()
                                    VM.isActivPlayerAt[2] = true
                                }
                        }

                        if VM.isActivPlayerAt[3] {
                            PlayersSelectionsCell(player: VM.playersScores[VM.playersScores.count - 1], positionInGrid: 4)
                        } else {
                            AddPlayerCell()
                                .onTapGesture {
                                    VM.addPlayer()
                                    VM.isActivPlayerAt[3] = true
                                }
                        }

                    }
                }
                
                
                Spacer()
                
                Button {
                    showGameView = true
                } label: {
                    Text("Start Game")
                        .font(.title)
                        .foregroundColor(K.Colors.darkViolet)
                        .frame(width: 160, height: 50)
                        .background(K.Colors.yellow)
                        .clipShape(Capsule())
                        .padding()
                        .opacity(disableStartButton ? 0.5 : 1.0)
                }
                .fullScreenCover(isPresented: $showGameView) {
                    GameView()
                }
                .disabled(disableStartButton)

                
            }
        }
    }
}

struct StartGameView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView()
    }
}
