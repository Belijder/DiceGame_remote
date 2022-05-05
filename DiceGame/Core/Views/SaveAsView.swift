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
                                vm.gameManager.saveAsOnes(for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                            Spacer()
                            Text("\(vm.gameManager.calculatePossiblePointValueToSaveAsOnes().asStringWith0decimalPlaces())")
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.twos] == 0.01 {
                        Button("Twos") {
                            vm.gameManager.saveAsTwos(for: currentPlayer)
                            vm.gameManager.changePlayer()
                            dismiss()
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.threes] == 0.01 {
                        Button("Threes") {
                            vm.gameManager.saveAsThrees(for: currentPlayer)
                            vm.gameManager.changePlayer()
                            dismiss()
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.fours] == 0.01 {
                        Button("Fours") {
                            vm.gameManager.saveAsFours(for: currentPlayer)
                            vm.gameManager.changePlayer()
                            dismiss()
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.fives] == 0.01 {
                        Button("Fives") {
                            vm.gameManager.saveAsFives(for: currentPlayer)
                            vm.gameManager.changePlayer()
                            dismiss()
                        }
                    }
                    if vm.gameManager.playersScores[currentPlayer - 1].scores[.sixes] == 0.01 {
                        Button("Sixes") {
                            vm.gameManager.saveAsSixes(for: currentPlayer)
                            vm.gameManager.changePlayer()
                            dismiss()
                        }
                    }
                    
                    
                    Section() {
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.pair] == 0.01 {
                            Button("Pair") {
                                vm.gameManager.saveAsPair(for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.twoPairs] == 0.01 {
                            Button("Two Pairs") {
                                vm.gameManager.saveAsTwoPairs(for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.threeOfKind] == 0.01 {
                            Button("Three of a kind") {
                                vm.gameManager.saveAsThreeOfKind(for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.smallStraight] == 0.01 {
                            Button("Small Straight") {
                                vm.gameManager.saveAsSmallStraight(for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.bigStraight] == 0.01 {
                            Button("Big Straight") {
                                vm.gameManager.saveAsBigStraight(for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.full] == 0.01 {
                            Button("Full") {
                                vm.gameManager.saveAsFull(for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.fourOfKind] == 0.01 {
                            Button("Four of a kind") {
                                vm.gameManager.saveAsFourOfKind(for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                        }
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.fiveOfKind] == 0.01 {
                            Button("Five of a kind") {
                                vm.gameManager.saveAsFiveOfKind(for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
                            }
                        }
                    }
                    Section {
                        if vm.gameManager.playersScores[currentPlayer - 1].scores[.chanse] == 0.01 {
                            Button("Chanse") {
                                vm.gameManager.saveAsChanse(for: currentPlayer)
                                vm.gameManager.changePlayer()
                                dismiss()
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
