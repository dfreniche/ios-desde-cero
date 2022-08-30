// (C) Diego Freniche 2022 - MIT License

import Foundation

public protocol UseCase {
    associatedtype InType
    associatedtype OutType

    func execute(inParameter: InType?) async -> OutType
}
