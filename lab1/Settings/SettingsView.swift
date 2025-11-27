import SwiftUI
struct SettingsView: View {
    @State private var viewModel = SettingsViewModel()

    var body: some View {
        NavigationStack {
            List {
                Section() {
                    ForEach(viewModel.items_vertical) { item in
                        NavigationLink(destination: buildDestination(item.destination)) {
                            HStack {
                                Image(systemName: item.icon)
                                    .foregroundStyle(item.color)
                                Text(item.title)
                            }
                        }
                    }
                }

                Section("Горизонтальний список") {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(viewModel.items_horizontal) { item in
                                NavigationLink(destination: buildDestination(item.destination)) {
                                    VStack {
                                        Image(systemName: item.icon)
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .foregroundStyle(item.color)
                                        Text(item.title)
                                            .font(.caption)
                                            .multilineTextAlignment(.center)
                                    }
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Налаштування")
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
