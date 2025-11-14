import Foundation
import Combine
@MainActor
class HomeViewModel: ObservableObject {
    @Published var images: [ImageItem] = []
    @Published var isImagesVisible = false

    init() {
        loadLocalImages()
    }

    private func loadLocalImages() {
        images = [
            ImageItem(name: "photo1"),
            ImageItem(name: "photo2"),
            ImageItem(name: "photo3")
        ]
    }

    func toggleImagesVisibility() {
        isImagesVisible.toggle()
    }
}
