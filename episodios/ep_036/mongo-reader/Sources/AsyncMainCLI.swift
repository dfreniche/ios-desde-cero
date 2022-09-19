//
//  AsyncMainCLI.swift
//  TestCLI
//
//  Created by Diego Freniche Brito on 14/9/22.
//  Copyright © 2022 Diego Freniche. All rights reserved.
//

import Foundation
import ArgumentParser
import ANSITerminal
import AppKit
import Files


// Sample Main Entry Point for your CLI app
// This is the async version (using async calls in code to download an image)
// You need to pass the image to download as an argument to this app
@available(macOS 12.0, *)
@main
struct MyFirstCLIProject: AsyncParsableCommand {
//    @Argument(help: "The URL to query.")
//    var URL: String
    
    mutating func run() async {
        print("Starting download...".blue)
    
        if let data = await queryMongoDB() {
            print("\(data)")
            
            
        }
            
        print("Finishing download...".blue)
    }
}
//        if let url = URL(string: URL) {
