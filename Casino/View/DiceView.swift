//
//  Dice.swift
//  Casino
//
//  Created by Vinicius Carvalho on 10/04/20.
//  Copyright © 2020 Vinicius Carvalho. All rights reserved.
//

import Foundation
import SwiftUI

struct DiceView: View {
    
    var dice: Dice
    var size: CGFloat
    
    func pointOf(_ index: Int) -> some View {
        DicePointView(size: self.size / 6)
            .opacity(self.dice.valueOf(index) ?? 0)
    }
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .frame(width: self.size, height: self.size, alignment: .leading)
                .foregroundColor(.white)
                .cornerRadius(10, antialiased: false)
                .padding(.all, 5)
                .shadow(radius: 20)
            
            HStack {
                VStack {
                    pointOf(1)
                    pointOf(2)
                    pointOf(3)
                }
                VStack {
                    pointOf(4)
                    pointOf(5)
                    pointOf(6)
                }
                VStack {
                    pointOf(7)
                    pointOf(8)
                    pointOf(9)
                }
            }
        }
    }
}

struct Dice_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                DiceView(dice: .one, size: 120)
                DiceView(dice: .two, size: 120)
            }
            HStack {
                DiceView(dice: .three, size: 120)
                DiceView(dice: .four, size: 120)
            }
            HStack {
                DiceView(dice: .five, size: 120)
                DiceView(dice: .six, size: 120)
            }
        }
        .previewLayout(.sizeThatFits)
    }
}
