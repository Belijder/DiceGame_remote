//
//  SaveAsView.swift
//  DiceGame
//
//  Created by Jakub Zajda on 02/01/2022.
//

import SwiftUI

struct SaveAsView: View {
    
    @EnvironmentObject var VM: ContentViewVM
    @Environment(\.dismiss) var dismiss
    
    var currentPlayer: Int
    
    var body: some View {
        NavigationView {
                List {
                    if VM.playersScores[currentPlayer - 1].ones == 0.01 {
                        Button("Ones") {
                            VM.saveAsOnes(for: currentPlayer)
                            dismiss()
                        }
                    }
                    if VM.playersScores[currentPlayer - 1].twos == 0.01 {
                        Button("Twos") {
                            VM.saveAsTwos(for: currentPlayer)
                            dismiss()
                        }
                    }
                    if VM.playersScores[currentPlayer - 1].threes == 0.01 {
                        Button("Threes") {
                            VM.saveAsThrees(for: currentPlayer)
                            dismiss()
                        }
                    }
                    if VM.playersScores[currentPlayer - 1].fours == 0.01 {
                        Button("Fours") {
                            VM.saveAsFours(for: currentPlayer)
                            dismiss()
                        }
                    }
                    if VM.playersScores[currentPlayer - 1].fives == 0.01 {
                        Button("Fives") {
                            VM.saveAsFives(for: currentPlayer)
                            dismiss()
                        }
                    }
                    if VM.playersScores[currentPlayer - 1].sixes == 0.01 {
                        Button("Sixes") {
                            VM.saveAsSixes(for: currentPlayer)
                            dismiss()
                        }
                    }
                    
                    
                    Section() {
                        if VM.playersScores[currentPlayer - 1].pair == 0.01 {
                            Button("Pair") {
                                VM.saveAsPair(for: currentPlayer)
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].twoPairs == 0.01 {
                            Button("Two Pairs") {
                                VM.saveAsTwoPairs(for: currentPlayer)
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].threeOfKind == 0.01 {
                            Button("Three of a kind") {
                                VM.saveAsThreeOfKind(for: currentPlayer)
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].smallStraight == 0.01 {
                            Button("Small Straight") {
                                VM.saveAsSmallStraight(for: currentPlayer)
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].bigStraight == 0.01 {
                            Button("Big Straight") {
                                VM.saveAsBigStraight(for: currentPlayer)
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].full == 0.01 {
                            Button("Full") {
                                VM.saveAsFull(for: currentPlayer)
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].fourOfKind == 0.01 {
                            Button("Four of a kind") {
                                VM.saveAsFourOfKind(for: currentPlayer)
                                dismiss()
                            }
                        }
                        if VM.playersScores[currentPlayer - 1].fiveOfKind == 0.01 {
                            Button("Five of a kind") {
                                VM.saveAsFiveOfKind(for: currentPlayer)
                                dismiss()
                            }
                        }
                    }
                    Section {
                        if VM.playersScores[currentPlayer - 1].chanse == 0.01 {
                            Button("Chanse") {
                                VM.saveAsChanse(for: currentPlayer)
                                dismiss()
                            }
                        }
                    }
                }
                .navigationTitle(Text("Save as:"))
                .navigationBarTitleDisplayMode(.inline)
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
