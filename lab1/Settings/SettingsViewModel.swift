import Observation
import SwiftUI

@MainActor
class SettingsViewModel {
     var modules: [any OrientableModule] = []

    init() {
        loadItems()
    }

    func loadItems() {
        modules = [
            Settings(icon: "gear", color: .blue, title: "Загальні налаштування", destination: .general, orientation: .vertical),

            Settings(icon: "paintbrush.fill", color: .purple, title: "Змінити тему", destination: .theme, orientation: .vertical),

            Settings(icon: "applelogo", color: .red, title: "Яблуко", destination: nil, orientation: .vertical),

            Settings(icon: "leaf.fill", color: .green, title: "Груша", destination: nil, orientation: .vertical),

            Helloween(text: "Ліхтарик", image: Image("photo1"), orientation: .horizontal),
            Helloween(text: "Скелет", image: Image("photo2"), orientation: .horizontal),
            Helloween(text: "Кіт у капелюсі", image: Image("photo3"), orientation: .horizontal),
            Helloween(text: "Павук", image: Image("photo4"), orientation: .horizontal),
            Helloween(text: "Привид", image: Image("photo5"), orientation: .horizontal),
            Helloween(text: "Цукерки", image: Image("photo6"), orientation: .horizontal),
            
            Settings(icon: "person.crop.circle", color: .blue, title: "Профіль", destination: nil, orientation: .vertical),
            Settings(icon: "bell.badge", color: .orange, title: "Сповіщення", destination: nil, orientation: .vertical),
            Settings(icon: "lock.shield", color: .red, title: "Конфіденційність", destination: nil, orientation: .vertical),
            Settings(icon: "wifi", color: .green, title: "Wi-Fi", destination: nil, orientation: .vertical),

        ]
    }
}
