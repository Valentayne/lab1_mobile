import SwiftUI

struct Helloween: Identifiable, OrientableModule {
    let id = UUID()
    let text: String
    let image: Image
    let orientation: Orientation

    func asSettings() -> Settings? { nil }
    func asHelloween() -> Helloween? { self }
}
