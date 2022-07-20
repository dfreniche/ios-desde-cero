// (C) Diego Freniche 2022 - MIT License

import PixelArtKit
import SwiftUI

@main struct PixelatorApp: App {
    var body: some Scene {
        WindowGroup {
            PixelArtListView(pixelArts: [])
                .onAppear {
#if DEBUG
                    assert(Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle") != nil, "Review Injection 3 installation")

                    if let injection3 = Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")
                    {
                        injection3.load()
                    } else {
                        fatalError("You need to install Injection 3 from the App Store.")
                    }
#endif
                }
        }
    }
}
