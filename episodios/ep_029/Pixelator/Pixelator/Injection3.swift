//
//  Injection3.swift
//  Pixelator
//
//  This is required to use Injection 3
//

import Foundation
import SwiftUI

#if DEBUG
private var loadInjection: () = {
    #if os(macOS)
    let bundleName = "macOSInjection.bundle"
    #elseif os(tvOS)
    let bundleName = "tvOSInjection.bundle"
    #elseif targetEnvironment(simulator)
    let bundleName = "iOSInjection.bundle"
    #else
    let bundleName = "maciOSInjection.bundle"
    #endif
    assert(Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/"+bundleName) != nil, "💀 Código manifiestamente mejorable")
    
    Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/"+bundleName)!.load()
}()

import Combine

public let injectionObserver = InjectionObserver()

public class InjectionObserver: ObservableObject {
    @Published var injectionNumber = 0
    var cancellable: AnyCancellable? = nil
    let publisher = PassthroughSubject<Void, Never>()
    init() {
        cancellable = NotificationCenter.default.publisher(for:
            Notification.Name("INJECTION_BUNDLE_NOTIFICATION"))
            .sink { [weak self] change in
            self?.injectionNumber += 1
            self?.publisher.send()
        }
    }
}

extension View {
    public func eraseToAnyView() -> some View {
        _ = loadInjection
        return AnyView(self)
    }
    public func onInjection(bumpState: @escaping () -> ()) -> some View {
        return self
            .onReceive(injectionObserver.publisher, perform: bumpState)
            .eraseToAnyView()
    }
}
#else
extension View {
    public func eraseToAnyView() -> some View { return self }
    public func onInjection(bumpState: @escaping () -> ()) -> some View {
        return self
    }
}
#endif
