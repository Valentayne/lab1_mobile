import Foundation
import Combine

@MainActor
class SearchViewModel: ObservableObject {
    @Published var items: [String] = []
    @Published var showingFruits = true

    private let fruits = ["🍎 Яблуко", "🍌 Банан", "🍐 Груша", "🍊 Апельсин"]
    private let vegetables = ["🥒 Огірок", "🍅 Помідор", "🥕 Морква", "🌽 Кукурудза"]

    init() {
        loadFruits()
    }

    func toggleCategory() {
        showingFruits.toggle()
        if showingFruits {
            loadFruits()
        } else {
            loadVegetables()
        }
    }

    private func loadFruits() {
        items = fruits
    }

    private func loadVegetables() {
        items = vegetables
    }
}
