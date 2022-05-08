//
//  ScoresView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 06/01/2022.
//

import SwiftUI

struct ScoresView: View {
    
    @ObservedObject var vm: GameViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            background
            VStack {
                title
                dices
                ScrollView {
                    HStack(alignment: .top) {
                        TitlesScoreboardCell()
                        ForEach(1..<vm.gameManager.playersScores.count + 1, id:\.self) { number in
                            PlayerScoreboardCell(vm: vm, playerNumber: number)
                        }
                    }
                    Spacer()
                }
            }
            dissmisButton
        }
    }
    
    init(vm: GameViewModel) {
        self.vm = vm
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView(vm: GameViewModel(gameManager: GameManager()))
    }
}

extension ScoresView {
    private var background: some View {
        K.Colors.lightViolet
            .ignoresSafeArea(.all)
    }
    
    private var title: some View {
        Text("Scores")
            .foregroundColor(K.Colors.darkViolet)
            .font(.largeTitle)
            .fontWeight(.black)
            .padding()
    }
    
    private var dices: some View {
        VStack {
            if vm.gameManager.currentNumberOfdiceRolls > 0 {
                HStack(spacing: 0) {
                    ForEach(vm.gameManager.dices) { dice in
                        DiceView(value: dice.value, size: 40)
                    }
                }
            }
        }
    }
    
    private var dissmisButton: some View {
        HStack {
            Spacer()
            VStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(K.Colors.yellow)
                        .frame(width: 50, height: 50)
                        .background(K.Colors.darkViolet)
                        .clipShape(Circle())
                }.padding()
                Spacer()
            }
        }
    }
}
