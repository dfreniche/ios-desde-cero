// (C) Diego Freniche 2022 - MIT License

import PixelArtKit
import RealmSwift
import SwiftUI

struct PixelArtListView: View {
    @State var pixelArts: [PixelArt]
    @State var deletedPixelArt = true

    @State var realm: Realm?
    @State var repository: PixelArtRepository?

    var body: some View {
        NavigationView {
            List($pixelArts) { pixelArt in
                NavigationLink(destination: deletedPixelArt ? PixelDrawingView(pixelArt: pixelArt) : PixelDrawingView(pixelArt: pixelArt))
                    {
                        // this is the "cell"
                        VStack {
                            Text("\(pixelArt.wrappedValue.name)")
                                .font(.title)
                                .foregroundColor(.green)
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
                            pixelArts.removeAll(where: { $0.id == pixelArt.id })

                            Task {
                                let _ = await DeletePixelArtUseCase(repository: repository!).execute(inParameter: pixelArt.wrappedValue)
                            }

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
        .task {
            realm = await RealmBuilder().getRealm(.development)
            repository = PixelArtRealmRepository(realm: realm)

            if let repository = repository {
                pixelArts = await LoadPixelArtsUseCase(repository: repository).execute()
            }
        }
#if DEBUG
            .eraseToAnyView() // Injection 3
#endif
    }

#if DEBUG
    @ObservedObject var iO = injectionObserver
#endif

    func addButtonView() -> some View {
        return Button("Add") {
            let newPixelArt = PixelArt(name: "Create a new Masterpiece", dateCreation: Date(), dateLastModification: Date())
            self.pixelArts.append(newPixelArt)
            Task {
                if let repository = repository {
                    let _ = await SavePixelArtUseCase(repository: repository).execute(inParameter: newPixelArt)
                }
            }
        }
    }
}
