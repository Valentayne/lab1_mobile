import SwiftUI

enum Module: Identifiable {
    case settings(Settings)
    case helloween(Helloween)

    var id: UUID {
        switch self {
        case .settings(let s): return s.id
        case .helloween(let h): return h.id
        }
    }

    var orientation: Orientation {
        switch self {
        case .settings(let s): return s.orientation
        case .helloween(let h): return h.orientation
        }
    }
}

enum Orientation {
    case horizontal
    case vertical
}

protocol OrientableModule: Identifiable {
    var orientation: Orientation { get set }
}
