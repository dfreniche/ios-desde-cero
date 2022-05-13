//
//  ContentView.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 5/5/22.
//

import SwiftUI

public struct PixelDrawingView: View {
    
    static let numberOfColumns = 10
    
    @State var pixelArt = PixelArt(pixels: PixelArt.generatePixelArtPattern(size: numberOfColumns),
                                   name: "",
                                   dateCreation: Date(),
                                   dateLastModification: Date())
    
    let columns: [GridItem] = generateColumns(numberOfColumns, columnWidht: 22)
    
    @State private var color = Color.blue
    
    private let pixelSquareSize = 20.0
    
    public init() {}
    
    public var body: some View {
        
        VStack {
            Text("\( pixelArt.name )")
                .padding()
            
            PixelArtView(pixelArt: pixelArt, colums: columns, pixelSquareSize: pixelSquareSize) { (pixel: Pixel) in
                print("Touch on row: \(pixel.row) col: \(pixel.col)")

                pixelArt = PixelArt.from(pixelArt: pixelArt, row: pixel.row, col: pixel.col, color: color, numberOfColumns: PixelDrawingView.numberOfColumns)
            }
            
            PixelArtView(pixelArt: pixelArt,
                         colums: PixelDrawingView.generateColumns(PixelDrawingView.numberOfColumns, columnWidht: 7),
                         pixelSquareSize: 5.0)
            
            ColorPicker("Pick color", selection: $color)
#if targetEnvironment(macCatalyst)
                .frame(maxHeight: 100)
#else
                .frame(maxHeight: 50)
#endif
            
            HStack {
                Button("Clear") {
                    pixelArt = PixelArt.from(pixelArt: pixelArt,
                                             newPixels: PixelArt.generatePixelArtPattern(size: 10, color: .black))
                }
                
                Button("Random") {
                    pixelArt = PixelArt.from(pixelArt: pixelArt,
                                             newPixels: PixelArt.generatePixelArtPattern(size: 10))
                }
                
                Button("Fill") {
                    pixelArt = PixelArt.from(pixelArt: pixelArt,
                                             newPixels: PixelArt.generatePixelArtPattern(size: 10, color: color))
                }
            }
        }
    }
}

extension PixelDrawingView {
    
    static func generateColumns(_ numCols: Int, columnWidht: CGFloat) -> [GridItem] {
        var columns: [GridItem] = []
        
        for _ in 0..<numCols {
            columns.append(GridItem(.fixed(columnWidht), spacing: 0, alignment: .center))
        }
        
        return columns
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PixelDrawingView()
    }
}
