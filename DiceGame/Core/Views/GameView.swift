//
//  ContentView.swift
//  DiceGame
//
//  Created by Jakub Zajda on 19/12/2021.
//

import SwiftUI
import CoreData

struct GameView: View {
    
    @ObservedObject var vm: GameViewModel
    @State var showSaveAsView = false
    @State var showScoreView = false
    @State private var confirmationShown = false
    
    var body: some View {
        ZStack {
            background
            
            VStack {
                HStack {
                    restartGameButton
                    Spacer()
                    scoreViewButton
                        .fullScreenCover(isPresented: $showScoreView) {
                            ScoresView(vm: vm)
                        }
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                playerInfo
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            
            VStack {
                if vm.gameManager.currentNumberOfdiceRolls == 0 {
                    rollButton
                } else {
                    dices
                }
            }
            
            VStack {
                Spacer()
                if vm.gameManager.currentNumberOfdiceRolls > 0 {
                    HStack {
                        rollAgainButton
                            .disabled(vm.gameManager.currentNumberOfdiceRolls == 3)
                        Spacer()
                        saveButton
                            .fullScreenCover(isPresented: $showSaveAsView) {
                                SaveAsView(vm: vm, currentPlayer: vm.gameManager.currentPlayer)
                            }
                    }
                    .padding(.horizontal)
                }
            }
            
            
           
            if vm.gameManager.gameIsEnded {
                endGamePopUp
            }
        }
    }
    
    init(vm: GameViewModel) {
        self.vm = vm
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(vm: GameViewModel(gameManager: GameManager()))
    }
}

extension GameView {
    
    private var background: some View {
        Image("background")
            .resizable()
            .scaleEffect(1.1)
            .ignoresSafeArea(.all)
    }
    
    private var restartGameButton: some View {
        
        Button(role: .destructive) {
            confirmationShown = true
        } label: {
            Text("Restart Game")
                .font(.subheadline)
                .foregroundColor(K.Colors.yellow)
                .frame(width: 120, height: 30)
                .background(K.Colors.darkViolet)
                .clipShape(Capsule())
                .padding(.horizontal)
        }
        .confirmationDialog(
            "Are you sure?",
            isPresented: $confirmationShown,
            titleVisibility: .visible
        ) {
            Button("Yes", role: .destructive) {
                vm.gameManager.prepareNewGame()
            }
        } message: {
            Text("This action cannot be undone. Would you like to proceed?")
                .font(.headline)
        }
    }
    
    private var playerInfo: some View {
        VStack {
            Text("Player \(vm.gameManager.currentPlayer)")
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(K.Colors.darkViolet)
            if !vm.gameManager.playersScores.isEmpty {
                Text("\(vm.gameManager.playersScores[vm.gameManager.currentPlayer - 1].playerName)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(K.Colors.darkViolet)
            }
        }
    }
    
    private var rollButton: some View {
        Button {
            vm.gameManager.roll()
            vm.saveGameProgress()
        } label: {
            Text("Roll")
                .font(.headline)
                .foregroundColor(K.Colors.darkViolet)
                .frame(width: UIScreen.main.bounds.width / 4, height: 40)
                .background(K.Colors.yellow)
                .clipShape(Capsule())
                .padding()
                .padding()
                .scaleEffect(1.3)
        }
    }
    
    private var selectedDiceOverlay: some View {
        RoundedRectangle(cornerRadius: 28)
            .fill(K.Colors.lightViolet)
            .frame(width: UIScreen.main.bounds.width / 3.5, height: UIScreen.main.bounds.width / 3.5)
            .opacity(0.5)
    }
    
    
    private var dices: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<3) { index in
                    if vm.gameManager.dices[index].isblocked {
                        DiceView(value: vm.gameManager.dices[index].value, size: UIScreen.main.bounds.width / 4.5)
                            .onTapGesture {
                                vm.selectDiceToRoll(index: index)
                            }
                    } else {
                        ZStack{
                            DiceView(value: vm.gameManager.dices[index].value, size: UIScreen.main.bounds.width / 4.5)
                            selectedDiceOverlay
                        }
                        .onTapGesture {
                            vm.unselectDice(index: index)
                        }
                    }
                }
            }.padding()
            
            HStack(spacing: 0) {
                ForEach(3..<5) { index in
                    if vm.gameManager.dices[index].isblocked {
                        DiceView(value: vm.gameManager.dices[index].value, size: UIScreen.main.bounds.width / 4.5)
                            .onTapGesture {
                                vm.selectDiceToRoll(index: index)
                            }

                    } else {
                        ZStack{
                            DiceView(value: vm.gameManager.dices[index].value, size: UIScreen.main.bounds.width / 4.5)
                            selectedDiceOverlay
                        }
                        .onTapGesture {
                            vm.unselectDice(index: index)
                        }
                    }
                }
            }.padding()
        }
    }
    
    private var rollAgainButton: some View {
        Button {
            vm.gameManager.roll()
            vm.saveGameProgress()
        } label: {
            Text("Roll Again")
                .font(.headline)
                .foregroundColor(K.Colors.darkViolet)
                .frame(width: UIScreen.main.bounds.width * 0.45, height: 50)
                .background(K.Colors.yellow)
                .clipShape(Capsule())
                .opacity(vm.gameManager.currentNumberOfdiceRolls == 3 ? 0.5 : 1.0)
        }
    }
    
    private var saveButton: some View {
        Button {
            vm.saveGameProgress()
            showSaveAsView = true
        } label: {
            Text("Save")
                .font(.headline)
                .foregroundColor(K.Colors.darkViolet)
                .frame(width: UIScreen.main.bounds.width * 0.30, height: 50)
                .background(K.Colors.yellow)
                .clipShape(Capsule())
        }
    }
    
    private var scoreViewButton: some View {
        Button {
            self.showScoreView = true
        } label: {
            Image(systemName: "tablecells")
                .foregroundColor(K.Colors.yellow)
                .frame(width: 40, height: 40)
                .background(K.Colors.darkViolet)
                .clipShape(Circle())
                .padding()
        }
    }
    
    
    
    private var endGamePopUp: some View {
        ZStack {
            VStack(spacing: 10) {
                Text("Game Over")
                    .foregroundColor(K.Colors.yellow)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.vertical, 10)
                    .padding(.top, 20)
                
                VStack {
                    Text("The winner is:")
                        .foregroundColor(K.Colors.yellow)
                        .font(.title)
                    Text(vm.gameManager.ranking[0].0)
                        .foregroundColor(K.Colors.yellow)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Final results:")
                        .font(.title2)
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
                }
                
                Button {
                    vm.gameManager.prepareNewGame()
                } label: {
                    Text("Play Again")
                        .font(.title2)
                        .foregroundColor(K.Colors.darkViolet)
                        .frame(width: 170, height: 50)
                        .background(K.Colors.yellow)
                        .clipShape(Capsule())
                        .padding()
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(K.Colors.darkViolet)
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .transition(.scale)
    }
    
}
