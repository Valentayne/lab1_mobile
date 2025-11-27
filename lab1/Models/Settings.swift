import SwiftUI

struct Settings: Identifiable {
    let id = UUID()
    let icon: String
    let color: Color
    let title: String
    let destination: SettingsDestination
}

enum SettingsDestination {
    case general
    case theme
}
