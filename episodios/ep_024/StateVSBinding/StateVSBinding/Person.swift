//
//  Person.swift
//  StateVSBinding
//
//  Created by Diego Freniche Brito on 19/5/22.
//

import Foundation

struct Person: Identifiable {
    let id = UUID()
    var name: String
    
    var _surname: String
    var surname: String {
        get {
            _surname + "."
        }
        
        set {
            _surname = newValue.uppercased()
        }
    }
    
    var salute: String {
        get {
            "Hello hello un saludito para el Sr. \( name )"
        }
    }
}
