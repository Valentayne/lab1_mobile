import Foundation
import Observation

@Observable
class HomeViewModel {
    var images: [ImageItem] = []
    var isImagesVisible = false
    
    func updateImages(isDarkMode: Bool) {
        images = [
            ImageItem(name: isDarkMode ? "photo4" : "photo1"),
            ImageItem(name: isDarkMode ? "photo5" : "photo2"),
            ImageItem(name: isDarkMode ? "photo6" : "photo3")
        ]
    }

    func toggleImagesVisibility() {
        isImagesVisible.toggle()
    }
}
