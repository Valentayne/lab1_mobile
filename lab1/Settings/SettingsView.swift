import SwiftUI
struct SettingsView: View {
    @State var viewModel = SettingsViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 12) {
                    buildSectionView()
                }
                .padding()
            }
            .navigationTitle("Модулі")
        }
    }

    @ViewBuilder
    func buildSectionView() -> some View {
        ForEach(viewModel.groupedSections) { section in
            switch section {
            case .vertical(let settings):
                // Якщо є destination → NavigationLink, інакше просто HStack
                if let dest = settings.destination {
                    NavigationLink(destination: buildDestination(dest)) {
                        HStack {
                            Image(systemName: settings.icon)
                                .foregroundStyle(settings.color)
                                .frame(width: 28, height: 28)
                            Text(settings.title)
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.03), radius: 2, x: 0, y: 1)
                    }
                } else {
                    HStack {
                        Image(systemName: settings.icon)
                            .foregroundStyle(settings.color)
                            .frame(width: 28, height: 28)
                        Text(settings.title)
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.03), radius: 2, x: 0, y: 1)
                }

            case .horizontal(let items):
                // Один ScrollView для усієї групи горизонтальних елементів
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(items) { h in
                            // Якщо Helloween має destination (не у твоїй моделі зараз),
                            // можна обернути в NavigationLink -- зараз рендеримо просто картку
                            VStack {
                                h.image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                    .cornerRadius(8)
                                Text(h.text)
                                    .font(.caption)
                                    .lineLimit(1)
                            }
                            .padding(8)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.02), radius: 2, x: 0, y: 1)
                        }
                    }
                    .padding(.vertical, 4)
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
