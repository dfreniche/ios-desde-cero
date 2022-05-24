//
//  SwiftUIView.swift
//
//
//  Created by Diego Freniche Brito on 12/5/22.
//

import SwiftUI


/// This view shows a PixelArt
/// If an action is passed it allows for reacting to taps on this view
public struct PixelArtView: View {
    public static let defaultColumnWidth = 10.0
    
    /// The PixelArt we want to show
    let pixelArt: PixelArt
    
    /// Column config for LazyVGrid
    let columns: [GridItem]
    
    /// Size of each pixel on Screen when PixelArt is rendered
    let pixelSquareSize: CGFloat
    
    /// Action performed when a pixel is tapped. Can be nil (nothing happens then).
    /// Useful for just showing a read-only PixelArtView
    let onPixelTapGestureAction: ((Pixel) -> Void)?

    public init(pixelArt: PixelArt, numColumns: Int, colums: [GridItem]?, columnWidth: CGFloat?, pixelSquareSize: CGFloat, onPixelTapGestureAction: ((Pixel) -> Void)? = nil) {
        self.pixelArt = pixelArt
        columns = colums ?? PixelArtView.generateColumns(numColumns, columnWidth: columnWidth ?? PixelArtView.defaultColumnWidth)
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

extension PixelArtView {
    public static func generateColumns(_ numCols: Int, columnWidth: CGFloat) -> [GridItem] {
        var columns: [GridItem] = []

        for _ in 0 ..< numCols {
            columns.append(GridItem(.fixed(columnWidth), spacing: 0, alignment: .center))
        }

        return columns
    }
}


 struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PixelArtView(pixelArt: PixelArt(name: "Test", dateCreation: Date(), dateLastModification: Date()),
                     numColumns: 10,
                     colums: nil,
                     columnWidth: 10,
                     pixelSquareSize: 10)
    }
 }
