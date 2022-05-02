//
//  DiceView.swift
//  DiceGame
//
//  Created by Kamila Mroziewska on 30/04/2022.
//

import SwiftUI

struct DiceView: View {
    
    let value: Int
    let size: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: size / 4)
                .foregroundColor(K.Colors.darkViolet)
                .frame(width: size, height: size)
             
            switch value {
                
            case 1:
                Circle()
                    .foregroundColor(K.Colors.yellow)
                    .frame(width: size / 4, height: size / 4)
                
            case 2:
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Spacer()
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                    }
                    Spacer()
                    HStack(spacing: 0) {
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                        Spacer()
                    }
                }
                .padding(size / 7)
                .frame(width: size, height: size)
                
            case 3:
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Spacer()
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                    }
                    HStack(spacing: 0) {
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                    }
                    HStack(spacing: 0) {
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                        Spacer()
                    }
                }
                .padding(size / 8)
                .frame(width: size, height: size)
              
            case 4:
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                        Spacer()
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                    }
                    Spacer()
                    HStack(spacing: 0) {
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                        Spacer()
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                    }
                }
                .padding(size / 7)
                .frame(width: size, height: size)
                
                
            case 5:
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                        Spacer()
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                    }
                    HStack(spacing: 0) {
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                    }
                    HStack(spacing: 0) {
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                        Spacer()
                        Circle()
                            .foregroundColor(K.Colors.yellow)
                            .frame(width: size / 4, height: size / 4)
                    }
                }
                .padding(size / 8)
                .frame(width: size, height: size)
                
            default:
                VStack(spacing: CGFloat(size / 30)) {
                    ForEach(1...3, id: \.self) { _ in
                        HStack(spacing: 0) {
                            Circle()
                                .foregroundColor(K.Colors.yellow)
                                .frame(width: size / 4, height: size / 4)
                            Spacer()
                            Circle()
                                .foregroundColor(K.Colors.yellow)
                                .frame(width: size / 4, height: size / 4)
                        }
                    }
                }
                .padding(size / 8)
                .frame(width: size, height: size)
            }
        }
        .padding(size / 5)
        
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(value: 1, size: 60
        )
            
    }
}
