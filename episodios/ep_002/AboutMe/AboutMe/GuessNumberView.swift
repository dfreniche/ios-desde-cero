//
//  GuessNumberView.swift
//  AboutMe
//
//  Created by Diego Freniche Brito on 17/2/22.
//

import SwiftUI

struct GuessNumberView: View {
    
    @State var number: String = ""
    @State var win = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Guess the number!")
            TextField("Your guess", text: $number)
                .padding()
            
            Spacer()
            
            if win {
                Text("YOU WIN! 🎉")
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .font(.largeTitle)
            } else {
                Text("YOU LOSE! 🙈")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .font(.largeTitle)
            }
            
            Spacer()
            
            Button("Click Me!") {
                print("Click! \( number )")
                
                if isNumberCorrect(numberGuessed: number) {
                    print("YEAH!")
                    win = true
                } else {
                    win = false
                }
            }
            .font(.title2)
            .padding(.horizontal, 60)
            .padding(.vertical, 20)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(20)
            
            Spacer()
        }
    }
    
    func isNumberCorrect(numberGuessed: String) -> Bool {
        if numberGuessed == "42"{
           return true
        } else {
           return false
        }
    }
}

struct GuessNumberView_Previews: PreviewProvider {
    static var previews: some View {
        GuessNumberView()
    }
}
