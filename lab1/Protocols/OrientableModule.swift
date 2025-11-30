import SwiftUI

enum ModuleSection: Identifiable {
    case vertical(Settings)
    case horizontal([Helloween])

    var id: UUID {
        switch self {
        case .vertical(let s): return s.id
        case .horizontal(let arr):
            return arr.first?.id ?? UUID()
        }
    }
}

enum Orientation {
    case horizontal
    case vertical
}

protocol OrientableModule: Identifiable {
    var id: UUID { get }
    var orientation: Orientation { get }
    func asSettings() -> Settings?
    func asHelloween() -> Helloween?
}
