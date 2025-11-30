import SwiftUI

enum SettingsDestination {
    case general
    case theme
}

struct Settings: Identifiable, OrientableModule {
    let id = UUID()
    let icon: String
    let color: Color
    let title: String
    let destination: SettingsDestination?
    let orientation: Orientation

    func asSettings() -> Settings? { self }
    func asHelloween() -> Helloween? { nil }
}
