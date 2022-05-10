//
//  ContentView.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 5/5/22.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        let colors: [Color] = [
            .red, .cyan, .blue, .green, .yellow
        ]
        
        return colors.randomElement() ?? .blue
    }
}

func generatePixelArtPattern(size: Int, color: Color? = nil) -> [Pixel] {
    var pixelArt: [Pixel] = []
    
    for row in 0..<size {
        for col in 0..<size {
            let pixel = Pixel(row: row, col: col, color: color ?? Color.random())
            pixelArt.append(pixel)
        }
    }
    
    return pixelArt
}

public struct PixelDrawingView: View {
    
    static let numberOfColumns = 10
    
    @State var pixelArt: [Pixel] = generatePixelArtPattern(size: numberOfColumns)
    
    let columns: [GridItem] = generateColumns(numberOfColumns)
    
    @State private var color = Color.blue
    
    private let pixelSquareSize = 20.0
    
    public init() {}
    
    public var body: some View {
        
        VStack {
            Text("Awesome Pixel Painter 🎨")
                .padding()
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 0) {
                ForEach(pixelArt) { pixel in
                    Rectangle()
                        .frame(width: pixelSquareSize, height: pixelSquareSize, alignment: .center)
                        .foregroundColor(pixel.color)
                        .border(Color.white, width: 1)
                        .onTapGesture {
                            print("Touch on row: \(pixel.row) col: \(pixel.col)")
                            
                            pixelArt[pixel.row * PixelDrawingView.numberOfColumns + pixel.col] = Pixel(row: pixel.row, col: pixel.col, color: color)
                        }
                }
            }
            
            ColorPicker("Pick color", selection: $color)
#if targetEnvironment(macCatalyst)
                .frame(maxHeight: 100)
#else
                .frame(maxHeight: 50)
#endif
            
            HStack {
                Button("Clear") {
                    pixelArt = generatePixelArtPattern(size: 10, color: .black)
                }
                
                Button("Random") {
                    pixelArt = generatePixelArtPattern(size: 10)
                }
                
                Button("Fill") {
                    pixelArt = generatePixelArtPattern(size: 10, color: color)
                }
            }
        }
    }
}

extension PixelDrawingView {
    
    static func generateColumns(_ numCols: Int) -> [GridItem] {
        var columns: [GridItem] = []
        
        for _ in 0..<numCols {
            columns.append(GridItem(.fixed(22), spacing: 0, alignment: .center))
        }
        
        return columns
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PixelDrawingView()
    }
}
