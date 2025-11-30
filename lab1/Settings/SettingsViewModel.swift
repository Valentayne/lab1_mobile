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
            Helloween(text: "Цукерки", image: Image("photo6"), orientation: .horizontal)
        ]
    }
    var groupedSections: [ModuleSection] {
        var result: [ModuleSection] = []
        var i = 0

        while i < modules.count {
            let current = modules[i]

            switch current.orientation {

            case .vertical:
                // спробуємо привести до Settings
                if let s = current.asSettings() {
                    result.append(.vertical(s))
                } else if let h = current.asHelloween() {
                    // вертикальний Helloween (якщо такий сценарій можливий)
                    // можна додати кастомну обробку або конвертувати в vertical Section
                    // наприклад, обертаємо в вертикальний список з одним елементом
                    result.append(.vertical(Settings(
                        icon: "", // якщо треба, можна додати іконку
                        color: .clear,
                        title: h.text,
                        destination: nil,
                        orientation: .vertical
                    )))
                } else {
                    // Якщо інші типи модулів — можна пропустити або логувати
                    print("Vertical module не належить до Settings або Helloween")
                }

                i += 1

            case .horizontal:
                // збираємо всі послідовні horizontal елементи
                var horizItems: [Helloween] = []
                var j = i
                while j < modules.count && modules[j].orientation == .horizontal {
                    if let h = modules[j].asHelloween() {
                        horizItems.append(h)
                    }
                    j += 1
                }
                if !horizItems.isEmpty {
                    result.append(.horizontal(horizItems))
                }
                i = j
            }
        }

        return result

    }
}
