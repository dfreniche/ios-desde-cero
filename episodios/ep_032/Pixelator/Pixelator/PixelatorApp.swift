// (C) Diego Freniche 2022 - MIT License

import PixelArtKit
import SwiftUI

@main struct PixelatorApp: App {
    @State var isLoaded = false
    var body: some Scene {
        WindowGroup {
            if isLoaded {
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
                    .task {
                        let _ = await RealmBuilder().getRealm(.mongoDBSync)
                        isLoaded = true
                    }
            } else {
                Text("Loading")
            }
        }
    }
}
