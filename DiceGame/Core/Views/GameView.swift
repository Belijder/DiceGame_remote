//
//  ContentView.swift
//  DiceGame
//
//  Created by Jakub Zajda on 19/12/2021.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var vm: GameViewModel
    

    @State var showSaveAsView = false
    @State var showScoreView = false
    @State var showEndGameView = false
    
    var body: some View {
        
            ZStack {
                background
                VStack {
                    playerInfo
                    
                    if vm.gameManager.currentNumberOfdiceRolls == 0 {
                        rollButton
                    } else {
                        VStack {
                            HStack(spacing: 0) {
                                ForEach(0..<3) { index in
                                    if vm.gameManager.dices[index].isblocked {
                                        DiceView(value: vm.gameManager.dices[index].value, size: UIScreen.main.bounds.width / 4.5)
                                            .onTapGesture {
                                                if let indx = vm.gameManager.dices.firstIndex(where: { $0.id == vm.gameManager.dices[index].id }) {
                                                    vm.gameManager.dices[indx].isblocked = false
                                                }
                                            }
                                    } else {
                                        ZStack{
                                            DiceView(value: vm.gameManager.dices[index].value, size: UIScreen.main.bounds.width / 4.5)
                                            RoundedRectangle(cornerRadius: 28)
                                                .fill(K.Colors.lightViolet)
                                                .frame(width: UIScreen.main.bounds.width / 3.5, height: UIScreen.main.bounds.width / 3.5)
                                                .opacity(0.5)
                                            
                                        }
                                        .onTapGesture {
                                            if let indx = vm.gameManager.dices.firstIndex(where: { $0.id == vm.gameManager.dices[index].id }) {
                                                vm.gameManager.dices[indx].isblocked = true
                                            }
                                        }
                                    }
                                }
                            }.padding()
                            
                            HStack(spacing: 0) {
                                ForEach(3..<5) { index in
                                    if vm.gameManager.dices[index].isblocked {
                                        DiceView(value: vm.gameManager.dices[index].value, size: UIScreen.main.bounds.width / 4.5)
                                            .onTapGesture {
                                                if let indx = vm.gameManager.dices.firstIndex(where: { $0.id == vm.gameManager.dices[index].id }) {
                                                    vm.gameManager.dices[indx].isblocked = false
                                                }
                                            }

                                    } else {
                                        ZStack{
                                            DiceView(value: vm.gameManager.dices[index].value, size: UIScreen.main.bounds.width / 4.5)
                                            RoundedRectangle(cornerRadius: 28)
                                                .fill(K.Colors.lightViolet)
                                                .frame(width: UIScreen.main.bounds.width / 3.5, height: UIScreen.main.bounds.width / 3.5)
                                                .opacity(0.5)
                                            
                                        }
                                        .onTapGesture {
                                            if let indx = vm.gameManager.dices.firstIndex(where: { $0.id == vm.gameManager.dices[index].id }) {
                                                vm.gameManager.dices[indx].isblocked = true
                                            }
                                        }
                                    }
                                }
                            }.padding()
                        }.padding(.top, 20)
                    }
                    

                    Spacer()
                    HStack {
                        if vm.gameManager.currentNumberOfdiceRolls > 0 {
                        Button {
                            vm.gameManager.roll()
                            } label: {
                                Text("Roll Again")
                                    .font(.title)
                                    .foregroundColor(K.Colors.darkViolet)
                                    .frame(width: UIScreen.main.bounds.width * 0.45, height: 50)
                                    .background(K.Colors.yellow)
                                    .clipShape(Capsule())
                                    .opacity(vm.gameManager.currentNumberOfdiceRolls == 3 ? 0.5 : 1.0)
                                
                            }.disabled(vm.gameManager.currentNumberOfdiceRolls == 3)
                        }
                        Spacer()
                        
                        if vm.gameManager.currentNumberOfdiceRolls > 0 {
                            Button {
                                showSaveAsView = true
                            } label: {
                                Text("Save")
                                    .font(.title)
                                    .foregroundColor(K.Colors.darkViolet)
                                    .frame(width: UIScreen.main.bounds.width * 0.30, height: 50)
                                    .background(K.Colors.yellow)
                                    .clipShape(Capsule())
                            }
                            .fullScreenCover(isPresented: $showSaveAsView) {
                                SaveAsView(vm: vm, currentPlayer: vm.gameManager.currentPlayer)
                            }
                        }

                    }
                    .padding(.horizontal)
                }
                .fullScreenCover(isPresented: $vm.gameManager.gameIsEnded) {
                    EndGameView(vm: vm)
                }
                    
                
                
                HStack {
                    Spacer()
                    VStack {
                        Button {
                            self.showScoreView = true
                        } label: {
                            Image(systemName: "tablecells")
                                .foregroundColor(K.Colors.yellow)
                                .frame(width: 30, height: 30)
                                .background(K.Colors.darkViolet)
                                .clipShape(Circle())
                                .padding()
                        }
                        Spacer()
                    }
                }
            }
        
        .fullScreenCover(isPresented: $showScoreView) {
            ScoresView(vm: vm)
        }

//        .onDisappear(perform: dismissView)
    }
    
    init(gameManager: GameManager) {
       _vm = StateObject(wrappedValue: GameViewModel(gameManager: gameManager))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameManager: GameManager())
    }
}

extension GameView {
    
    private var background: some View {
        Image("background")
            .resizable()
            .scaleEffect(1.1)
            .ignoresSafeArea(.all)
    }
    
    private var playerInfo: some View {
        VStack {
            Text("Player \(vm.gameManager.currentPlayer)")
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(K.Colors.darkViolet)
                .padding(.top, 20)
            Text("\(vm.gameManager.playersScores[vm.gameManager.currentPlayer - 1].playerName)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(K.Colors.darkViolet)
        }
    }
    
    private var rollButton: some View {
        Button {
            vm.gameManager.roll()
        } label: {
            Text("Roll")
                .font(.title)
                .foregroundColor(K.Colors.darkViolet)
                .frame(width: UIScreen.main.bounds.width / 4, height: 60)
                .background(K.Colors.yellow)
                .clipShape(Capsule())
                .padding()
                .padding(.top, 100)
                .scaleEffect(1.3)
        }
    }
    
    
}
