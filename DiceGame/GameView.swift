//
//  ContentView.swift
//  DiceGame
//
//  Created by Jakub Zajda on 19/12/2021.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var gameViewVM = GameViewVM()

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
            Image("background")
                .resizable()
                .scaleEffect(1.1)
                .ignoresSafeArea(.all)

            
            VStack {
                Text("Player \(gameViewVM.currentPlayer)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(K.Colors.darkViolet)
                    .padding(.top, 20)
                
                
                if gameViewVM.currentNumberOfdiceRolls == 0 {
                    Button {
                        gameViewVM.roll()
                    } label: {
                        Text("Roll")
                            .font(.title)
                            .foregroundColor(K.Colors.darkViolet)
                            .frame(width: 100, height: 50)
                            .background(K.Colors.yellow)
                            .clipShape(Capsule())
                            .padding()
                            .padding(.top, 100)
                            .scaleEffect(1.3)
                    }
                } else {
                    VStack {
                        HStack {
                            ForEach(0..<3) { index in
                                if gameViewVM.dices[index].isblocked {
                                    ZStack{
                                        Image("\(gameViewVM.dices[index].image)")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 28))
                                            .padding()
                                        RoundedRectangle(cornerRadius: 28)
                                            .fill(K.Colors.lightViolet)
                                            .frame(width: 120, height: 120)
                                            .opacity(0.5)
                                        
                                    }
                                    .onTapGesture {
                                        if let indx = gameViewVM.dices.firstIndex(where: { $0.id == gameViewVM.dices[index].id }) {
                                            gameViewVM.dices[indx].isblocked = false
                                        }
                                    }
                                } else {
                                    Image("\(gameViewVM.dices[index].image)")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 28))
                                        .padding()
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
                                    ZStack{
                                        Image("\(gameViewVM.dices[index].image)")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 28))
                                            .padding()
                                        RoundedRectangle(cornerRadius: 28)
                                            .fill(K.Colors.lightViolet)
                                            .frame(width: 120, height: 120)
                                            .opacity(0.5)
                                        
                                    }
                                    .onTapGesture {
                                        if let indx = gameViewVM.dices.firstIndex(where: { $0.id == gameViewVM.dices[index].id }) {
                                            gameViewVM.dices[indx].isblocked = false
                                        }
                                    }
                                } else {
                                    Image("\(gameViewVM.dices[index].image)")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 28))
                                        .padding()
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
                                .frame(width: 160, height: 50)
                                .background(K.Colors.yellow)
                                .clipShape(Capsule())
                                .padding()
                                .opacity(gameViewVM.currentNumberOfdiceRolls == 2 ? 0.5 : 1.0)
                            
                                
                            
                        }.disabled(gameViewVM.currentNumberOfdiceRolls == 2)
                    }
                    Spacer()
                    
                    if gameViewVM.currentNumberOfdiceRolls > 0 {
                        Button {
                            showSaveAsView = true
                        } label: {
                            Text("Save")
                                .font(.title)
                                .foregroundColor(K.Colors.darkViolet)
                                .frame(width: 100, height: 50)
                                .background(K.Colors.yellow)
                                .clipShape(Capsule())
                                .padding()
                        }
                        .fullScreenCover(isPresented: $showSaveAsView) {
                            SaveAsView(currentPlayer: gameViewVM.currentPlayer)
                        }
                    }

                }
                .padding(.horizontal)
            }.fullScreenCover(isPresented: $gameViewVM.gameIsEnded, content: EndGameView.init)
            
            
            HStack {
                Spacer()
                VStack {
                    Button {
                        self.showScoreView = true
                    } label: {
                        Image(systemName: "tablecells")
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: 50, height: 50)
                            .background(K.Colors.darkViolet)
                            .clipShape(Circle())
                            .padding()
                    }
                    Spacer()
                }
            }
            Button("End") {
                self.showEndGameView = true
            }
            

        }
        .fullScreenCover(isPresented: $showScoreView) {
            ScoresView()
        }
        .environmentObject(gameViewVM)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
