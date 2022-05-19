//
//  AddPlayerCell.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 16/01/2022.
//

import SwiftUI

struct AddPlayerCell: View {
    var body: some View {
        VStack {
            Text("Add player")
                .foregroundColor(K.Colors.darkViolet)
                .font(.title2)
                .fontWeight(.regular)
            VStack {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .font(.title2)
                    .foregroundColor(K.Colors.yellow)
                    .background(K.Colors.darkViolet)
                    .clipShape(Circle())
                    .scaledToFit()
            }.frame(width: 80, height: 80, alignment: .center)
            Spacer()
        }.frame(width: UIScreen.main.bounds.width * 0.5, height: 220)
    }
}

struct AddPlayerCell_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerCell()
    }
}
