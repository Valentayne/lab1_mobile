import SwiftUI

enum Orientation {
    case horizontal
    case vertical
}

protocol OrientableModule: Identifiable {
    var id: UUID { get }
    var orientation: Orientation { get }
}
