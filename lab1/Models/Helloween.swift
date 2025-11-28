import SwiftUI

struct Helloween: Identifiable, OrientableModule {
    let id = UUID()
    let text: String
    let image: Image
    var orientation: Orientation
}
