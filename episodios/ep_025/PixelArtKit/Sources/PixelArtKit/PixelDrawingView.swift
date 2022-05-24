//
//  ContentView.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 5/5/22.
//

import SwiftUI

/// This view allows to modify a PixelArt
/// Uses PixelArtView to show the pixel art
public struct PixelDrawingView: View {
    static let numberOfColumns = 10

    @Binding public var pixelArt: PixelArt
    @State private var draftPixelArt: PixelArt

    let columns: [GridItem] = PixelArtView.generateColumns(numberOfColumns, columnWidth: 22)

    @State private var color = Color.blue

    private let pixelSquareSize = 20.0

    // Must be public to allow creating instances out of this package
    public init(pixelArt: Binding<PixelArt>) {
        _pixelArt = pixelArt
        _draftPixelArt = State(initialValue: pixelArt.wrappedValue)
    }

    public var body: some View {
        VStack {
            TextField("\(pixelArt.name)", text: $pixelArt.name)
                .padding()

            PixelArtView(pixelArt: draftPixelArt,
                         numColumns: columns.count,
                         colums: columns,
                         columnWidth: 10,
                         pixelSquareSize: pixelSquareSize) { (pixel: Pixel) in
                print("Touch on row: \(pixel.row) col: \(pixel.col)")

                draftPixelArt = PixelArt.from(pixelArt: draftPixelArt, row: pixel.row, col: pixel.col, color: color, numberOfColumns: PixelDrawingView.numberOfColumns)
#if os(iOS)
                pixelArt = draftPixelArt
#endif
            }

            PixelArtView(pixelArt: draftPixelArt,
                         numColumns: columns.count,
                         colums: PixelArtView.generateColumns(PixelDrawingView.numberOfColumns, columnWidth: 7),
                         columnWidth: 10,
                         pixelSquareSize: 5.0)

            ColorPicker("Pick color", selection: $color)
            #if targetEnvironment(macCatalyst)
                .frame(maxHeight: 100)
            #else
                .frame(maxHeight: 50)
            #endif

            HStack {
                Button("Clear") {
                    draftPixelArt = PixelArt.from(pixelArt: pixelArt,
                                             newPixels: PixelArt.generatePixelArtPattern(size: 10, color: .black))
                    pixelArt = draftPixelArt
                }

                Button("Random") {
                    draftPixelArt = PixelArt.from(pixelArt: pixelArt,
                                             newPixels: PixelArt.generatePixelArtPattern(size: 10))
                    pixelArt = draftPixelArt
                }

                Button("Fill") {
                    draftPixelArt = PixelArt.from(pixelArt: pixelArt,
                                             newPixels: PixelArt.generatePixelArtPattern(size: 10, color: color))
                    pixelArt = draftPixelArt
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PixelDrawingView(pixelArt: .constant(PixelArt(name: "Hello", dateCreation: Date(), dateLastModification: Date())))
    }
}
