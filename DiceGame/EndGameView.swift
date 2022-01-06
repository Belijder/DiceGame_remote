//
//  EndGameView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 03/01/2022.
//

import SwiftUI

struct EndGameView: View {
    
    @EnvironmentObject var VM: ContentViewVM
    
    var body: some View {
        Text("The End")
    }
}

struct EndGameView_Previews: PreviewProvider {
    static var previews: some View {
        EndGameView()
    }
}
