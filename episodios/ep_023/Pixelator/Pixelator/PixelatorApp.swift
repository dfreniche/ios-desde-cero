//
//  PixelatorApp.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 5/5/22.
//

import PixelArtKit
import SwiftUI

@main struct PixelatorApp: App {
    var body: some Scene {
        WindowGroup {
            PixelArtListView(pixelArts: generatePixelArts())
        }
    }    
}
