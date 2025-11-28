import Observation
import SwiftUI

@Observable
class SettingsViewModel {
    var modules: [Module] = []

    init() {
        loadItems()
    }

    func loadItems() {
        modules = [

            .settings(Settings(icon: "gear", color: .blue, title: "Загальні налаштування", destination: .general, orientation: .vertical)),
            .settings(Settings(icon: "paintbrush.fill", color: .purple, title: "Змінити тему", destination: .theme, orientation: .vertical)),
            .settings(Settings(icon: "applelogo", color: .red, title: "Яблуко", destination: nil, orientation: .vertical)),
            .settings(Settings(icon: "leaf.fill", color: .green, title: "Груша", destination: nil, orientation: .vertical)),

            .helloween(Helloween(text: "Ліхтарик", image: Image("photo1"), orientation: .horizontal)),
            .helloween(Helloween(text: "Скелет", image: Image("photo2"), orientation: .horizontal)),
            .helloween(Helloween(text: "Кіт у капелюсі", image: Image("photo3"), orientation: .horizontal)),
            .helloween(Helloween(text: "Павук", image: Image("photo4"), orientation: .horizontal)),
            .helloween(Helloween(text: "Привид", image: Image("photo5"), orientation: .horizontal)),
            .helloween(Helloween(text: "Цукерки", image: Image("photo6"), orientation: .horizontal))
        ]
    }
}

