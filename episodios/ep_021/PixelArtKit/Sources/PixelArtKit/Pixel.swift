//
//  File.swift
//  
//
//  Created by Diego Freniche Brito on 9/5/22.
//

import SwiftUI

public class Pixel {
    /// row starts at zero
    public let row: Int
    
    /// col starts at zero
    public let col: Int
    
    public var color: Color
    
    public init(row: Int, col: Int, color: Color) {
        self.row = row
        self.col = col
        self.color = color
    }
}

extension Pixel: Identifiable {
    public var id: String {
        "row:\(row)col:\(col)"
    }
}
