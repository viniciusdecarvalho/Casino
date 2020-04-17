//
//  ContentView.swift
//  Casino
//
//  Created by Vinicius Carvalho on 10/04/20.
//  Copyright © 2020 Vinicius Carvalho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var size: CGFloat = 60
    @State var dices: [Dice] = Dice.random(count: 2)
    @State var indexNumberOfDices: Int = 1
    @State var winnerValue: Int = 7
    @State var gaming = false
    
    @State var score = 0
    
    fileprivate func game() {
        self.gaming.toggle()
        withAnimation() {
            self.dices = Dice.random(count: self.indexNumberOfDices + 1)
            self.score += Dice.isWinner(winnerValue: self.winnerValue, self.dices) ? 1 : 0
            self.gaming.toggle()
        }
    }
    
    var body: some View {
                    
        ZStack {
            Color(.gray)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Section(header: Text(LocalizedStringKey("dices"))) {
                    Group {
                        Text(LocalizedStringKey("number_of_dices"))
                        Picker("", selection: self.$indexNumberOfDices) {
                            ForEach(1 ..< 6) { i in
                                Image(systemName: "\(i).circle")
                                    .font(.body)
                                    .tag(i)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }
                        
                    Group {
                        Text(LocalizedStringKey("winner_with"))
                        Picker(selection: self.$winnerValue, label: Text("")) {
                            ForEach(1 ..< (self.indexNumberOfDices + 1) * Dice.last.number) { i in
                                Text("\(i-1)")
                            }
                        }
                    }
                }
                
                Spacer()
                
                Group {
                    HStack {
                        ForEach(self.dices, id: \.self) { dice in
                            DiceView(dice: dice, size: self.size)
                                .rotationEffect(.degrees(self.gaming ? 90 : 0))
                                .scaleEffect(self.gaming ? 1.5 : 1)
                                .animation(.spring())
                        }
                    }
                }

                Spacer()
                
                Group {
                    
                    Text("\(self.score)")
                    
                    Image(systemName: (Dice.isWinner(winnerValue: self.winnerValue, self.dices) ? "hand.thumbsup" : "hand.thumbsdown"))
                        .frame(width: 64, height: 64, alignment: .center)
                        .rotationEffect(.degrees(self.gaming ? 180 : 0))
                        .scaleEffect(self.gaming ? 1.1 : 2)
                        .padding()
                        .animation(.spring())
                        .overlay(Circle()
                            .stroke(Color.white, lineWidth: 2)
                            .frame(width: 64, height: 64, alignment: .center)
                        )
                    
                    Button(action: {
                        self.game()
                    }){
                        
                        VStack {
                            Image(systemName: "goforward")
                                .font(.headline)
                        }
                    }
                    .buttonStyle(GradientBackgroundStyle())
                    .frame(width: 100, height: 100, alignment: .center)
                    
                }
            }
        }
    }
}

struct GradientBackgroundStyle: ButtonStyle {
 
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration
            .label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(20)
            .padding(.horizontal, 10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
