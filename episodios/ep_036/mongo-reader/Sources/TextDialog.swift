//
//  TextDialog.swift
//  fdir
//
//  Created by Diego Freniche Brito on 14/7/21.
//

import Foundation
import ANSITerminal

struct TextDialog {
    enum Answers {
        case YES
        case NO
    }
    
    let question: String
    
    func readAnswer() -> Answers {
        print(question + "(y/n)? ")

        // LOL this is a thowback to really, really bad code
        // I LOVE IT
        while (true) {
            switch readChar() {
            case "y":
                return Answers.YES
            case "n":
                return Answers.NO
            default:
                break
            }
        }
    }

}

