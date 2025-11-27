import Observation
import SwiftUI

@Observable
class SettingsViewModel {
    var items_vertical: [Settings] = []
    var items_horizontal: [Settings] = []

    init() {
        loadVerticalSettings()
        loadHorizontalSettings()
    }

    func loadVerticalSettings() {
        items_vertical = [
            Settings(icon: "gear", color: .blue, title: "Загальні налаштування", destination: .general),
            Settings(icon: "paintbrush.fill", color: .purple, title: "Змінити тему", destination: .theme)
        ]
    }

    func loadHorizontalSettings() {
        items_horizontal = [
            Settings(icon: "gear", color: .blue, title: "Загальні налаштування", destination: .general),
            Settings(icon: "paintbrush.fill", color: .purple, title: "Змінити тему", destination: .theme),
            Settings(icon: "star.fill", color: .yellow, title: "Особливе", destination: .general),
            Settings(icon: "moon.fill", color: .gray, title: "Темна тема", destination: .theme)
        ]
    }
}
