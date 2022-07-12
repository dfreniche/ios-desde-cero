//
//  UseCase.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 7/7/22.
//

import Foundation

public protocol UseCase {
    associatedtype InType
    associatedtype OutType
    
    func execute(inParameter: InType?) async -> OutType
}
