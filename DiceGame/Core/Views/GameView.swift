//
//  ContentView.swift
//  DiceGame
//
//  Created by Jakub Zajda on 19/12/2021.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameViewVM: GameViewModel
    
    @Environment(\.dismiss) var dismiss

    @State var showSaveAsView = false
    @State var showScoreView = false
    @State var showEndGameView = false
    
    let columns1 = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120))
    ]
    
    var body: some View {
        
            ZStack {
                background

                
                VStack {
                    playerInfo
                    
                    if gameViewVM.currentNumberOfdiceRolls == 0 {
                        rollButton
                    } else {
                        VStack {
                            HStack {
                                ForEach(0..<3) { index in
                                    if gameViewVM.dices[index].isblocked {
                                        
                                        Image("\(gameViewVM.dices[index].image)")
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width / 4.5, height: UIScreen.main.bounds.width / 4.5)
                                            .clipShape(RoundedRectangle(cornerRadius: 28))
                                            .padding()
                                            .onTapGesture {
                                                if let indx = gameViewVM.dices.firstIndex(where: { $0.id == gameViewVM.dices[index].id }) {
                                                    gameViewVM.dices[indx].isblocked = false
                                                }
                                            }
                                    } else {
                                        ZStack{
                                            Image("\(gameViewVM.dices[index].image)")
                                                .resizable()
                                                .frame(width: UIScreen.main.bounds.width / 4.5, height: UIScreen.main.bounds.width / 4.5)
                                                .clipShape(RoundedRectangle(cornerRadius: 28))
                                                .padding()
                                            RoundedRectangle(cornerRadius: 28)
                                                .fill(K.Colors.lightViolet)
                                                .frame(width: UIScreen.main.bounds.width / 3.5, height: UIScreen.main.bounds.width / 3.5)
                                                .opacity(0.5)
                                            
                                        }
                                        .onTapGesture {
                                            if let indx = gameViewVM.dices.firstIndex(where: { $0.id == gameViewVM.dices[index].id }) {
                                                gameViewVM.dices[indx].isblocked = true
                                            }
                                        }
                                    }
                                }
                            }
                            
                            HStack {
                                ForEach(3..<5) { index in
                                    if gameViewVM.dices[index].isblocked {
                                        
                                        Image("\(gameViewVM.dices[index].image)")
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width / 4.5, height: UIScreen.main.bounds.width / 4.5)
                                            .clipShape(RoundedRectangle(cornerRadius: 28))
                                            .padding()
                                            .onTapGesture {
                                                if let indx = gameViewVM.dices.firstIndex(where: { $0.id == gameViewVM.dices[index].id }) {
                                                    gameViewVM.dices[indx].isblocked = false
                                                }
                                            }

                                    } else {
                                        ZStack{
                                            Image("\(gameViewVM.dices[index].image)")
                                                .resizable()
                                                .frame(width: UIScreen.main.bounds.width / 4.5, height: UIScreen.main.bounds.width / 4.5)
                                                .clipShape(RoundedRectangle(cornerRadius: 28))
                                                .padding()
                                            RoundedRectangle(cornerRadius: 28)
                                                .fill(K.Colors.lightViolet)
                                                .frame(width: UIScreen.main.bounds.width / 3.5, height: UIScreen.main.bounds.width / 3.5)
                                                .opacity(0.5)
                                            
                                        }
                                        .onTapGesture {
                                            if let indx = gameViewVM.dices.firstIndex(where: { $0.id == gameViewVM.dices[index].id }) {
                                                gameViewVM.dices[indx].isblocked = true
                                            }
                                        }
                                    }
                                }
                            }
                        }.padding(.top, 20)
                    }
                    

                    Spacer()
                    HStack {
                        if gameViewVM.currentNumberOfdiceRolls > 0 {
                        Button {
                            gameViewVM.roll()
                            } label: {
                                Text("Roll Again")
                                    .font(.title)
                                    .foregroundColor(K.Colors.darkViolet)
                                    .frame(width: UIScreen.main.bounds.width * 0.45, height: 50)
                                    .background(K.Colors.yellow)
                                    .clipShape(Capsule())
                                    .opacity(gameViewVM.currentNumberOfdiceRolls == 3 ? 0.5 : 1.0)
                                
                            }.disabled(gameViewVM.currentNumberOfdiceRolls == 3)
                        }
                        Spacer()
                        
                        if gameViewVM.currentNumberOfdiceRolls > 0 {
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
                                SaveAsView(currentPlayer: gameViewVM.currentPlayer)
                            }
                        }

                    }
                    .padding(.horizontal)
                }.fullScreenCover(isPresented: $gameViewVM.gameIsEnded) {
                    EndGameView()
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
            ScoresView()
        }
        .environmentObject(gameViewVM)
        .onDisappear(perform: dismissView)
    }
    
    func dismissView() {
        dismiss()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
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
            Text("Player \(gameViewVM.currentPlayer)")
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(K.Colors.darkViolet)
                .padding(.top, 20)
            Text("\(gameViewVM.playersScores[gameViewVM.currentPlayer - 1].playerName)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(K.Colors.darkViolet)
        }
    }
    
    private var rollButton: some View {
        Button {
            gameViewVM.roll()
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
