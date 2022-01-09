//
//  SaveAsView.swift
//  DiceGame
//
//  Created by Jakub Zajda on 02/01/2022.
//

import SwiftUI

struct SaveAsView: View {
    
    @EnvironmentObject var VM: GameViewVM
    @Environment(\.dismiss) var dismiss
    
    var currentPlayer: Int
    
    var body: some View {
        NavigationView {
            ZStack{
                List {
                    if VM.playersScores[currentPlayer - 1].scores[.ones] == 0.01 {
                        Button("Ones") {
                            VM.saveAsOnes(for: currentPlayer)
                            VM.changePlayer()
                            dismiss()
                        }
                    }
                    if VM.playersScores[currentPlayer - 1].scores[.twos] == 0.01 {
                        Button("Twos") {
                            VM.saveAsTwos(for: currentPlayer)
                            VM.changePlayer()
                            dismiss()
                        }
                    }
                    if VM.playersScores[currentPlayer - 1].scores[.threes] == 0.01 {
                        Button("Threes") {
                            VM.saveAsThrees(for: currentPlayer)
                            VM.changePlayer()
                            dismiss()
                        }
                    }
                    if VM.playersScores[currentPlayer - 1].scores[.fours] == 0.01 {
                        Button("Fours") {
                            VM.saveAsFours(for: currentPlayer)
                            VM.changePlayer()
                            dismiss()
                        }
                    }
                    if VM.playersScores[currentPlayer - 1].scores[.fives] == 0.01 {
                        Button("Fives") {
                            VM.saveAsFives(for: currentPlayer)
                            VM.changePlayer()
                            dismiss()
                        }
                    }
                    if VM.playersScores[currentPlayer - 1].scores[.sixes] == 0.01 {
                        Button("Sixes") {
                            VM.saveAsSixes(for: currentPlayer)
                            VM.changePlayer()
                            dismiss()
                        }
                    }
                    
                    
                    Section() {
                        if VM.playersScores[currentPlayer - 1].scores[.pair] == 0.01 {
                            Button("Pair") {
                                VM.saveAsPair(for: currentPlayer)
                                VM.changePlayer()
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].scores[.twoPairs] == 0.01 {
                            Button("Two Pairs") {
                                VM.saveAsTwoPairs(for: currentPlayer)
                                VM.changePlayer()
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].scores[.threeOfKind] == 0.01 {
                            Button("Three of a kind") {
                                VM.saveAsThreeOfKind(for: currentPlayer)
                                VM.changePlayer()
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].scores[.smallStraight] == 0.01 {
                            Button("Small Straight") {
                                VM.saveAsSmallStraight(for: currentPlayer)
                                VM.changePlayer()
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].scores[.bigStraight] == 0.01 {
                            Button("Big Straight") {
                                VM.saveAsBigStraight(for: currentPlayer)
                                VM.changePlayer()
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].scores[.full] == 0.01 {
                            Button("Full") {
                                VM.saveAsFull(for: currentPlayer)
                                VM.changePlayer()
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].scores[.fourOfKind] == 0.01 {
                            Button("Four of a kind") {
                                VM.saveAsFourOfKind(for: currentPlayer)
                                VM.changePlayer()
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].scores[.fiveOfKind] == 0.01 {
                            Button("Five of a kind") {
                                VM.saveAsFiveOfKind(for: currentPlayer)
                                VM.changePlayer()
                                dismiss()
                            }
                        }
                    }
                    Section {
                        if VM.playersScores[currentPlayer - 1].scores[.chanse] == 0.01 {
                            Button("Chanse") {
                                VM.saveAsChanse(for: currentPlayer)
                                VM.changePlayer()
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
}

struct SaveAsView_Previews: PreviewProvider {
    static var previews: some View {
        SaveAsView(currentPlayer: 1)
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
