import SwiftUI

struct Pokemon: Identifiable {
    let id: Int         // because ForEach
    let name: String
    let url: URL?
    let color: Color?
}
