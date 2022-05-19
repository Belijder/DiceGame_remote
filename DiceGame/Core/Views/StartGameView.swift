//
//  StartGameView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 10/01/2022.
//

import SwiftUI

struct StartGameView: View {
    
    @ObservedObject var vm: GameViewModel
    
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
            backgroud
            VStack {
                titleAndSubtitle
                Spacer()
                playerSelectionsGrid
                Spacer()
                startGameButton
                    .fullScreenCover(isPresented: $vm.gameManager.gameIsInProgress) {
                    GameView(vm: vm)
                }
                .disabled(disableStartButton)
            }
        }.onAppear(perform: vm.loadGameProgress)
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

extension StartGameView {
    
    private var backgroud: some View {
        K.Colors.lightViolet
            .ignoresSafeArea(.all)
    }
    
    private var titleAndSubtitle: some View {
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
        }
    }
    
    private var startGameButton: some View {
        Button {
            vm.gameManager.gameIsInProgress = true
        } label: {
            Text("Start Game")
                .font(.headline)
                .foregroundColor(K.Colors.darkViolet)
                .frame(width: 160, height: 50)
                .background(K.Colors.yellow)
                .clipShape(Capsule())
                .padding()
                .opacity(disableStartButton ? 0.5 : 1.0)
        }
    }
    
    private var playerSelectionsGrid: some View {
//        This way doesn't work for now
        /*
//        let columns = [
//            GridItem(.fixed(UIScreen.main.bounds.width / 2), spacing: 10),
//            GridItem(.fixed(UIScreen.main.bounds.width / 2), spacing: 10)
//        ]
//        LazyVGrid(columns: columns) {
//            ForEach(0..<4) { inx in
//                if vm.gameManager.isActivPlayerAt[inx] {
//                    PlayersSelectionsCell(vm: vm, player: vm.gameManager.playersScores[vm.gameManager.playersScores.count - 1], positionInGrid: inx + 1)
//                } else {
//                    AddPlayerCell()
//                        .onTapGesture {
//                            vm.gameManager.addPlayer()
//                            vm.gameManager.isActivPlayerAt[inx] = true
//                        }
//                }
//            }
//        }
         */
        
          return VStack {
            HStack {
                if vm.gameManager.isActivPlayerAt[0] {
                    PlayersSelectionsCell(vm: vm, player: vm.gameManager.playersScores[vm.gameManager.playersScores.count - 1], positionInGrid: 1)
                } else {
                    AddPlayerCell()
                        .onTapGesture {
                            vm.gameManager.addPlayer()
                            vm.gameManager.isActivPlayerAt[0] = true
                        }
                }

                if vm.gameManager.isActivPlayerAt[1] {
                    PlayersSelectionsCell(vm: vm, player: vm.gameManager.playersScores[vm.gameManager.playersScores.count - 1], positionInGrid: 2)
                } else {
                    AddPlayerCell()
                        .onTapGesture {
                            vm.gameManager.addPlayer()
                            vm.gameManager.isActivPlayerAt[1] = true
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
    }
}
