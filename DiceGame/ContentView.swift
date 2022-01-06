//
//  ContentView.swift
//  DiceGame
//
//  Created by Jakub Zajda on 19/12/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var contentViewVM = ContentViewVM()

    @State var showSaveAsView = false
    
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
                Text("Player \(contentViewVM.currentPlayer)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(K.Colors.darkViolet)
                    .padding(.top, 20)
                
                
                if contentViewVM.currentNumberOfdiceRolls == 0 {
                    Button {
                        contentViewVM.roll()
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
                                    if contentViewVM.dices[index].isblocked {
                                        ZStack{
                                            Image("\(contentViewVM.dices[index].image)")
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
                                            if let indx = contentViewVM.dices.firstIndex(where: { $0.id == contentViewVM.dices[index].id }) {
                                                contentViewVM.dices[indx].isblocked = false
                                            }
                                        }
                                    } else {
                                        Image("\(contentViewVM.dices[index].image)")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 28))
                                            .padding()
                                            .onTapGesture {
                                                if let indx = contentViewVM.dices.firstIndex(where: { $0.id == contentViewVM.dices[index].id }) {
                                                    contentViewVM.dices[indx].isblocked = true
                                                }
                                            }
                                    }
                                }
                            }
                            
                            HStack {
                                ForEach(3..<5) { index in
                                    if contentViewVM.dices[index].isblocked {
                                        ZStack{
                                            Image("\(contentViewVM.dices[index].image)")
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
                                            if let indx = contentViewVM.dices.firstIndex(where: { $0.id == contentViewVM.dices[index].id }) {
                                                contentViewVM.dices[indx].isblocked = false
                                            }
                                        }
                                    } else {
                                        Image("\(contentViewVM.dices[index].image)")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 28))
                                            .padding()
                                            .onTapGesture {
                                                if let indx = contentViewVM.dices.firstIndex(where: { $0.id == contentViewVM.dices[index].id }) {
                                                    contentViewVM.dices[indx].isblocked = true
                                                }
                                            }
                                    }
                                }
                            }
                        }.padding(.top, 20)
                        
                        
//                    LazyVGrid(columns: columns1, alignment: .center, spacing: 10) {
//                        ForEach(contentViewVM.dices[0]...contentViewVM.dices[2]) { dice in
//                            if dice.isblocked {
//                                ZStack{
//                                    Image("\(dice.image)")
//                                        .resizable()
//                                        .frame(width: 100, height: 100)
//                                        .clipShape(RoundedRectangle(cornerRadius: 28))
//                                        .padding()
//                                    RoundedRectangle(cornerRadius: 28)
//                                        .fill(K.Colors.lightViolet)
//                                        .frame(width: 120, height: 120)
//                                        .opacity(0.5)
//
//                                }
//                                .onTapGesture {
//                                    if let index = contentViewVM.dices.firstIndex(where: { $0.id == dice.id }) {
//                                        contentViewVM.dices[index].isblocked = false
//                                    }
//                                }
//                            } else {
//                            Image("\(dice.image)")
//                                .resizable()
//                                .frame(width: 100, height: 100)
//                                .clipShape(RoundedRectangle(cornerRadius: 28))
//                                .padding()
//                                .onTapGesture {
//                                    if let index = contentViewVM.dices.firstIndex(where: { $0.id == dice.id }) {
//                                        contentViewVM.dices[index].isblocked = true
//                                    }
//                                }
//                            }
//                        }
//                        .padding(.top, 20)
//                    }
                }

                Spacer()
                HStack {
                    if contentViewVM.currentNumberOfdiceRolls > 0 {
                    Button {
                        contentViewVM.roll()
                        } label: {
                            Text("Roll Again")
                                .font(.title)
                                .foregroundColor(K.Colors.darkViolet)
                                .frame(width: 160, height: 50)
                                .background(K.Colors.yellow)
                                .clipShape(Capsule())
                                .padding()
                                .opacity(contentViewVM.currentNumberOfdiceRolls == 2 ? 0.5 : 1.0)
                            
                                
                            
                        }.disabled(contentViewVM.currentNumberOfdiceRolls == 2)
                    }
                    Spacer()
                    
                    if contentViewVM.currentNumberOfdiceRolls > 0 {
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
                        // Tutaj dać funkcję na onDismiss która zmienia playera na kolejnego.??
                        .sheet(isPresented: $showSaveAsView, onDismiss: contentViewVM.changePlayer) {
                            SaveAsView(currentPlayer: contentViewVM.currentPlayer)
                        }
                    }

                }
                .padding(.horizontal)
            }.fullScreenCover(isPresented: $contentViewVM.gameIsEnded) {
                EndGameView()
            }

        }
        .environmentObject(contentViewVM)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
