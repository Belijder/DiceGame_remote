//
//  StartGameView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 10/01/2022.
//

import SwiftUI

struct StartGameView: View {
    
    @ObservedObject var vm: GameViewModel
    
    
    @State var showGameView = false
    
    private var disableStartButton: Bool {
        
        var returnValue = true
        
        if vm.gameManager.playersScores.count == 0 {
            returnValue = true
        } else {
            returnValue = false
        }
    
        for number in 0..<vm.gameManager.playersScores.count {
            if vm.gameManager.playersScores[number].playerName.trimmingCharacters(in: .whitespaces) == "" {
                returnValue = true
            } else {
                returnValue = false
            }
        }
        
        return returnValue
    }

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
                
                
                
                VStack {
                    HStack {
                        if vm.gameManager.isActivPlayerAt[0] {
                            PlayersSelectionsCell(vm: vm, player: vm.gameManager.playersScores[vm.gameManager.playersScores.count - 1], positionInGrid: 1)
                        } else {
                            AddPlayerCell()
                                .onTapGesture {
                                    vm.gameManager.addPlayer()
                                    vm.gameManager.isActivPlayerAt[0] = true
                                    print(vm.gameManager.isActivPlayerAt)
                                    print(vm.gameManager.playersScores)
                                }
                        }

                        if vm.gameManager.isActivPlayerAt[1] {
                            PlayersSelectionsCell(vm: vm, player: vm.gameManager.playersScores[vm.gameManager.playersScores.count - 1], positionInGrid: 2)
                        } else {
                            AddPlayerCell()
                                .onTapGesture {
                                    vm.gameManager.addPlayer()
                                    vm.gameManager.isActivPlayerAt[1] = true
                                    print(vm.gameManager.isActivPlayerAt)
                                    print(vm.gameManager.playersScores)
                                }
                        }

                    }

                    HStack {
                        if vm.gameManager.isActivPlayerAt[2] {
                            PlayersSelectionsCell(vm: vm, player: vm.gameManager.playersScores[vm.gameManager.playersScores.count - 1], positionInGrid: 3)
                        } else {
                            AddPlayerCell()
                                .onTapGesture {
                                    vm.gameManager.addPlayer()
                                    vm.gameManager.isActivPlayerAt[2] = true
                                }
                        }

                        if vm.gameManager.isActivPlayerAt[3] {
                            PlayersSelectionsCell(vm: vm, player: vm.gameManager.playersScores[vm.gameManager.playersScores.count - 1], positionInGrid: 4)
                        } else {
                            AddPlayerCell()
                                .onTapGesture {
                                    vm.gameManager.addPlayer()
                                    vm.gameManager.isActivPlayerAt[3] = true
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
                    GameView(vm: vm)
                }
                .disabled(disableStartButton)
                .onAppear {
                    if vm.gameManager.gameIsInProgress {
                        self.showGameView = true
                    }
                }
            }
        }
    }
    
    init(gameManager: GameManager) {
        _vm = ObservedObject(wrappedValue: GameViewModel(gameManager: gameManager))
    }
}

struct StartGameView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView(gameManager: GameManager())
    }
}
