import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("Головна")
                    .font(.largeTitle)
                    .bold()

                Button(viewModel.isImagesVisible ? "Сховати картинки" : "Показати картинки") {
                    viewModel.toggleImagesVisibility()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom)

                ScrollView {
                    if viewModel.isImagesVisible {
                        VStack(spacing: 20) {
                            ForEach(viewModel.images) { imageItem in
                                Image(imageItem.name)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(16)
                                    .shadow(radius: 5)
                                    .transition(.opacity.combined(with: .scale))
                            }
                        }
                        .padding()
                        .animation(.easeInOut, value: viewModel.isImagesVisible)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview("MainTabView") {
    MainTabView()
}
