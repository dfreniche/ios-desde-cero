// (C) Diego Freniche 2022 - MIT License

import Foundation
import SwiftUI

extension Color {
    func rgbaComponents() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }

    static func fromRGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> Color {
        Color(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}
