//
//  File.swift
//
//
//  Created by Diego Freniche Brito on 12/5/22.
//

import SwiftUI

extension Color {
    /// Generates a random color
    /// - Returns: a color from .red, .cyan, .blue, .green, .yellow
    static func random() -> Color {
        let colors: [Color] = [
            .red, .cyan, .blue, .green, .yellow,
        ]

        return colors.randomElement() ?? .blue
    }
}
