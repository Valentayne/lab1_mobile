import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Продукти")
                    .font(.largeTitle)
                    .bold()

                Button(viewModel.showingFruits ? "Показати овочі 🥕" : "Показати фрукти 🍎") {
                    viewModel.toggleCategory()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .buttonBorderShape(.roundedRectangle)

                List(viewModel.items, id: \.self) { item in
                    Text(item)
                        .font(.title2)
                }
            }
            .padding(20)
        }
    }
}

#Preview("SearchView") {
    SearchView()
}
