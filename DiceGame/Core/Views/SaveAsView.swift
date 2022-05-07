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
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.ones]! == nil {
                        HStack {
                            Button("Ones") {
                                vm.gameManager.saveAs(.ones, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsOnes())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.twos]! == nil {
                        HStack {
                            Button("Twos") {
                                vm.gameManager.saveAs(.twos, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsTwos())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.threes]! == nil {
                        HStack {
                            Button("Threes") {
                                vm.gameManager.saveAs(.threes, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsThrees())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.fours]! == nil {
                        HStack {
                            Button("Fours") {
                                vm.gameManager.saveAs(.fours, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsFours())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.fives]! == nil {
                        HStack {
                            Button("Fives") {
                                vm.gameManager.saveAs(.fives, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsFives())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.sixes]! == nil {
                        HStack {
                            Button("Sixes") {
                                vm.gameManager.saveAs(.sixes, for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsSixes())")
                                .foregroundColor(Color.secondary)
                        }
                    }
                    
                    
                    Section() {
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.pair]! == nil {
                            HStack {
                                Button("Pair") {
                                    vm.gameManager.saveAs(.pair, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsPair())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.twoPairs]! == nil {
                            HStack {
                                Button("Two Pairs") {
                                    vm.gameManager.saveAs(.twoPairs, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsTwoPairs())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.threeOfKind]! == nil {
                            HStack {
                                Button("Three of a kind") {
                                    vm.gameManager.saveAs(.threeOfKind, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsThreeOfKind())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.smallStraight]! == nil {
                            HStack {
                                Button("Small Straight") {
                                    vm.gameManager.saveAs(.smallStraight, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsSmallStraight())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.bigStraight]! == nil {
                            HStack {
                                Button("Big Straight") {
                                    vm.gameManager.saveAs(.bigStraight, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsBigStraight())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.full]! == nil {
                            HStack {
                                Button("Full") {
                                    vm.gameManager.saveAs(.full, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsFull())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.fourOfKind]! == nil {
                            HStack {
                                Button("Four of a kind") {
                                    vm.gameManager.saveAs(.fourOfKind, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsFourOfKind())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.fiveOfKind]! == nil {
                            HStack {
                                Button("Five of a kind") {
                                    vm.gameManager.saveAs(.fiveOfKind, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsFiveOfKind())")
                                    .foregroundColor(Color.secondary)
                            }
                        }
                    }
                    Section {
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.chanse]! == nil {
                            HStack {
                                Button("Chanse") {
                                    vm.gameManager.saveAs(.chanse, for: currentPlayer)
                                    vm.gameManager.changePlayer()
                                    dismiss()
                                }
                                Spacer()
                                Text("+ \(vm.gameManager.calculatePossiblePointValueToSaveAsChanse())")
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
