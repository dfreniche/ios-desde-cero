//
//  main.swift
//  MyFirstCLIProject
//
//  Created by Diego Freniche Brito on 1/9/22.
//

import Foundation
import ArgumentParser
import ANSITerminal
import AppKit
import Files

@main
struct MyFirstCLIProject: AsyncParsableCommand {
//    @Flag(help: "Shows verbose info.")
//    var verbose = false
    
//    @Flag(help: "Downloads an image.")
//    var download = false
    
    @Argument(help: "The image to download.")
    var imageURL: String
    
    mutating func run() async {
        
        print("Starting download...".blue)
        
//        let imageURL = "http://cdn2.estamosrodando.com/biografias/8/7/chiquito-de-la-calzada-360533.jpg"
        if let url = URL(string: imageURL) {
            
            do {
                let (data, urlResponse) = try await URLSession.shared.data(from: url)
                
                print("Hay datos".green)
                
                try showImage(data)
            } catch {
                print("Error downloading \(error)".red)
            }
            
            print("Finishing download...".blue)
        }
    }
}

func showImage(_ data: Data) throws {
    guard let _ = NSImage(data: data) else { return }
    
    let imageWithTextFile = try Folder.temporary.createFile(at: "\(UUID().description).png", contents: data)
    
    Process.launch(command: "/usr/bin/open", arguments: ["\(imageWithTextFile.path)"])
}
