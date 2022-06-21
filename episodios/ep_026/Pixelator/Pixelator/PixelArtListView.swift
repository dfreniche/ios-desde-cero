//
//  PixelArtListView.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 16/5/22.
//

import PixelArtKit
import SwiftUI

struct PixelArtListView: View {
    @State var pixelArts: [PixelArt]
    @State var deletedPixelArt = true
    
    var body: some View {
        NavigationView {
            List($pixelArts) { pixelArt in
                NavigationLink(destination: deletedPixelArt ? PixelDrawingView(pixelArt: pixelArt) : PixelDrawingView(pixelArt: pixelArt)) {
                    // this is the "cell"
                    VStack {
                        Text("\(pixelArt.wrappedValue.name)")
                        PixelArtView(pixelArt: pixelArt.wrappedValue,
                                     numColumns: 10,
                                     colums: PixelArtView.generateColumns(10, columnWidth: 3),
                                     columnWidth: 10,
                                     pixelSquareSize: 2)
                    }
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button(role: .destructive) {
                        print("PixelArt \(pixelArt.name) is being deleted.")
                        // option 1: functional purity inmutable
//                        let filteredPixelArts = pixelArts.filter { $0.id != pixelArt.id  }
//                        pixelArts = filteredPixelArts
//
                       // option 2: filthy mutable
                        pixelArts.removeAll(where: {$0.id==pixelArt.id})
                        
                        if let firstPixelArt = $pixelArts.first {
                            // Navigate to 1st Pixel art after deletion
                            deletedPixelArt = true
                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            .navigationTitle("Gallery")
            .navigationBarItems(trailing: addButtonView())
        }
    }
    
    func addButtonView() -> some View {        
        return Button("Add") {
            self.pixelArts.append(PixelArt(name: "Create a new Masterpiece", dateCreation: Date(), dateLastModification: Date()))
        }
    }
}

struct PixelArtListView_Previews: PreviewProvider {
    static var previews: some View {
        PixelArtListView(pixelArts: generateRandomPixelArts())
    }
}
