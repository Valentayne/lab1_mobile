import SwiftUI
    struct SettingsView: View {
        @State private var viewModel = SettingsViewModel()

        var body: some View {
            NavigationStack {
                List {
                    Section {
                        buildSectionView()
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Налаштування")
            }
        }
        
        @ViewBuilder
        func buildSectionView() -> some View {
            ForEach(viewModel.modules) { module in
                switch module {

                case .settings(let item):
                    if let destination = item.destination {
                        NavigationLink(destination: buildDestination(destination)) {
                            HStack {
                                Image(systemName: item.icon)
                                    .foregroundStyle(item.color)
                                Text(item.title)
                            }
                        }
                    } else {
                        HStack {
                            Image(systemName: item.icon)
                                .foregroundStyle(item.color)
                            Text(item.title)
                        }
                    }

                case .helloween(let item):
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            VStack {
                                item.image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                Text(item.text)
                            }
                            .padding()
                            .background(Color.orange.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                }
            }
        }

        @ViewBuilder
        private func buildDestination(_ destination: SettingsDestination) -> some View {
            switch destination {
            case .general:
                GeneralSettingsView()
            case .theme:
                ThemeSettingsView()
            }
        }
}
