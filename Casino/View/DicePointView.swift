//
//  DicePoint.swift
//  Casino
//
//  Created by Vinicius Carvalho on 10/04/20.
//  Copyright © 2020 Vinicius Carvalho. All rights reserved.
//

import SwiftUI

struct DicePointView: View {
    
    var size: CGFloat
    
    var body: some View {
        Circle()
            .foregroundColor(Color.black)
            .frame(width: size, height: size, alignment: .leading)
            .padding(.all, size / 10)
    }
}

struct DicePoint_Previews: PreviewProvider {
    static var previews: some View {
        DicePointView(size: 50)
            .previewLayout(.sizeThatFits)
    }
}
