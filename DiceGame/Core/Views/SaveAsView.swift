//
//  SaveAsView.swift
//  DiceGame
//
//  Created by Jakub Zajda on 02/01/2022.
//

import SwiftUI

struct SaveAsView: View {
    
    @ObservedObject var vm: GameViewModel
    @Environment(\.dismiss) var dismiss
    
    var currentPlayer: Int
    
    var body: some View {
        NavigationView {
            ZStack{
                List {
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.ones] == 0.01 {
                        HStack {
                            Button("Ones") {
                                vm.gameManager.saveAs(.ones, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsOnes().asStringWith0decimalPlaces())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.twos] == 0.01 {
                        HStack {
                            Button("Twos") {
                                vm.gameManager.saveAs(.twos, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsTwos().asStringWith0decimalPlaces())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.threes] == 0.01 {
                        HStack {
                            Button("Threes") {
                                vm.gameManager.saveAs(.threes, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsThrees().asStringWith0decimalPlaces())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.fours] == 0.01 {
                        HStack {
                            Button("Fours") {
                                vm.gameManager.saveAs(.fours, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsFours().asStringWith0decimalPlaces())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.fives] == 0.01 {
                        HStack {
                            Button("Fives") {
                                vm.gameManager.saveAs(.fives, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsFives().asStringWith0decimalPlaces())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.sixes] == 0.01 {
                        HStack {
                            Button("Sixes") {
                                vm.gameManager.saveAs(.sixes, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsSixes().asStringWith0decimalPlaces())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    
                    
                    Section() {
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.pair] == 0.01 {
                            HStack {
                                Button("Pair") {
                                    vm.gameManager.saveAs(.pair, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsPair().asStringWith0decimalPlaces())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.twoPairs] == 0.01 {
                            HStack {
                                Button("Two Pairs") {
                                    vm.gameManager.saveAs(.twoPairs, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsTwoPairs().asStringWith0decimalPlaces())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.threeOfKind] == 0.01 {
                            HStack {
                                Button("Three of a kind") {
                                    vm.gameManager.saveAs(.threeOfKind, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsThreeOfKind().asStringWith0decimalPlaces())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.smallStraight] == 0.01 {
                            HStack {
                                Button("Small Straight") {
                                    vm.gameManager.saveAs(.smallStraight, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsSmallStraight().asStringWith0decimalPlaces())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.bigStraight] == 0.01 {
                            HStack {
                                Button("Big Straight") {
                                    vm.gameManager.saveAs(.bigStraight, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsBigStraight().asStringWith0decimalPlaces())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.full] == 0.01 {
                            HStack {
                                Button("Full") {
                                    vm.gameManager.saveAs(.full, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsFull().asStringWith0decimalPlaces())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.fourOfKind] == 0.01 {
                            HStack {
                                Button("Four of a kind") {
                                    vm.gameManager.saveAs(.fourOfKind, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsFourOfKind().asStringWith0decimalPlaces())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.fiveOfKind] == 0.01 {
                            HStack {
                                Button("Five of a kind") {
                                    vm.gameManager.saveAs(.fiveOfKind, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsFiveOfKind().asStringWith0decimalPlaces())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                    }
                    Section {
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.chanse] == 0.01 {
                            HStack {
                                Button("Chanse") {
                                    vm.gameManager.saveAs(.chanse, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsChanse().asStringWith0decimalPlaces())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                    }
                }
            }
                
                .navigationTitle(Text("Save as:"))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button("Cancel") {
                                                    dismiss()
                })
        }
    }
    
    init(vm: GameViewModel, currentPlayer: Int) {
        self.vm = vm
        self.currentPlayer = currentPlayer
    }
}

struct SaveAsView_Previews: PreviewProvider {
    static var previews: some View {
        SaveAsView(vm: GameViewModel(gameManager: GameManager()), currentPlayer: 1)
    }
}

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
