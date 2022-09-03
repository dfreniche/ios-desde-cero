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

@main
struct MyFirstCLIProject: ParsableCommand {
    @Flag(help: "Shows verbose info.")
    var verbose = false
    
    @Flag(help: "Downloads an image.")
    var download = false
    
    @Argument(help: "The name to say.")
    var name: String?
    
    mutating func run() throws {
        printSomething(s: name ?? "[]")
        
        if download {
            print("Starting download...")
            
            let imageURL = "http://cdn2.estamosrodando.com/biografias/8/7/chiquito-de-la-calzada-360533.jpg"
            if let url = URL(string: imageURL) {
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data, let originalImage = NSImage(data: data) {
                        print("Hay datos")
//                        let imageWithText = originalImage.print(text: message)
//                        let imageWithTextFile = try Folder.temporary.createFile(at: "tmp.png", contents: imageWithText.png)
//
//                        Process.launch(command: "/usr/bin/open", arguments: ["\(imageWithTextFile.path)"])
                    }
                }
                
                task.resume()
            }
            
            print("Finishing download...")
            
        }
    }
}


func printSomething(s: String) {
    print("More \(s)".red)
}
