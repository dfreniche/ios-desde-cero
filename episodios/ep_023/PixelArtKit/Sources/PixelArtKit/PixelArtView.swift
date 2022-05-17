//
//  SwiftUIView.swift
//
//
//  Created by Diego Freniche Brito on 12/5/22.
//

import SwiftUI

public struct PixelArtView: View {
    let pixelArt: PixelArt
    let columns: [GridItem]
    let pixelSquareSize: CGFloat
    let onPixelTapGestureAction: ((Pixel) -> Void)?

    public init(pixelArt: PixelArt, colums: [GridItem], pixelSquareSize: CGFloat, onPixelTapGestureAction: ((Pixel) -> Void)? = nil) {
        self.pixelArt = pixelArt
        columns = colums
        self.pixelSquareSize = pixelSquareSize
        self.onPixelTapGestureAction = onPixelTapGestureAction
    }

    public var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 0) {
            ForEach(pixelArt.pixels) { pixel in
                Rectangle()
                    .frame(width: pixelSquareSize, height: pixelSquareSize, alignment: .center)
                    .foregroundColor(pixel.color)
                    .border(Color.clear, width: 1)
                    .onTapGesture {
                        onPixelTapGestureAction?(pixel)
                    }
            }
        }
    }
}

// struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        PixelArtView()
//    }
// }
