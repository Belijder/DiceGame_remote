//
//  PlayersSelectionsCell.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 10/01/2022.
//

import SwiftUI

struct PlayersSelectionsCell: View {
    
    @ObservedObject var vm: GameViewModel
    @State var player: PlayerScore
    let positionInGrid: Int
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        
        
        VStack {
            if player.playerName == "" {
                Text("Player")
                    .foregroundColor(K.Colors.darkViolet)
                    .font(.title)
                    .fontWeight(.light)
                    .frame(height: 30)
            } else {
            Text(player.playerName)
                .foregroundColor(K.Colors.darkViolet)
                .font(.title)
                .fontWeight(.bold)
                .frame(height: 30)
            }
            
            ZStack(alignment: .topTrailing) {
                VStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .font(.largeTitle)
                        .foregroundColor(K.Colors.darkViolet)
                        .background(K.Colors.yellow)
                        .clipShape(Circle())
                        .scaledToFit()
                }
                .frame(width: 80, height: 80, alignment: .center)
                
                Button {
                    if let index = vm.gameManager.playersScores.firstIndex(where: { $0.id == player.id }) {
                        vm.gameManager.removePlayer(at: index)
                        vm.gameManager.isActivPlayerAt[positionInGrid - 1] = false
                    }
                    
                } label: {
                    Image(systemName: "x.circle.fill")
                        .font(.title)
                        .background(K.Colors.yellow)
                        .foregroundColor(K.Colors.darkViolet)
                        .clipShape(Circle())
                }
                .offset(x: 15, y: -5)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(K.Colors.darkViolet, lineWidth: 3)
                    .frame(width: 140, height: 40, alignment: .center)
                TextField("Name", text: $player.playerName)
                    .onChange(of: player, perform: { newValue in
                        if let inx = vm.gameManager.playersScores.firstIndex(where: { $0.id == player.id } ) {
                            vm.gameManager.playersScores[inx] = player
                        }
                    })
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.plain)
                    .frame(width: 120, height: 30, alignment: .center)
                    .background(K.Colors.lightViolet)
                    .focused($textFieldIsFocused)
                    .submitLabel(.done)
                    .onSubmit {
                        textFieldIsFocused = false
                    }
            }.padding()
            Spacer()  
        }.frame(width: UIScreen.main.bounds.width * 0.5, height: 220)
        
    }
    
    init(vm: GameViewModel, player: PlayerScore, positionInGrid: Int) {
        self.vm = vm
        _player = State(wrappedValue: player)
        self.positionInGrid = positionInGrid
    }
    
}

struct PlayersSelectionsCell_Previews: PreviewProvider {
    static var previews: some View {
        PlayersSelectionsCell(vm: GameViewModel(gameManager: GameManager()), player: PlayerScore(playerNumber: 1, playerName: "Kuba", scores: [:]), positionInGrid: 1)
    }
}
