//
//  File.swift
//
//
//  Created by Diego Freniche Brito on 12/5/22.
//

import SwiftUI

public struct PixelArt: Identifiable {
    public let pixels: [Pixel]
    public var name: String
    public let dateCreation: Date
    public let dateLastModification: Date

    // SwiftUI identifiable
    public let id = UUID().uuidString

    public static func generatePixelArtPattern(size: Int, color: Color? = nil) -> [Pixel] {
        var pixelArt: [Pixel] = []

        for row in 0 ..< size {
            for col in 0 ..< size {
                let pixel = Pixel(row: row, col: col, color: color ?? Color.random())
                pixelArt.append(pixel)
            }
        }

        return pixelArt
    }

    public static func from(pixelArt: PixelArt, newPixels: [Pixel]) -> PixelArt {
        PixelArt(pixels: newPixels,
                 name: pixelArt.name,
                 dateCreation: pixelArt.dateCreation,
                 dateLastModification: pixelArt.dateLastModification)
    }

    public static func from(pixelArt: PixelArt, row: Int, col: Int, color: Color, numberOfColumns: Int) -> PixelArt {
        var pixels = pixelArt.pixels

        pixels[row * numberOfColumns + col] = Pixel(row: row, col: col, color: color)

        return from(pixelArt: pixelArt, newPixels: pixels)
    }

    public init(pixels: [Pixel] = generatePixelArtPattern(size: 10),
                name: String,
                dateCreation: Date,
                dateLastModification: Date)
    {
        self.pixels = pixels
        self.name = name
        self.dateCreation = dateCreation
        self.dateLastModification = dateLastModification
    }
}
