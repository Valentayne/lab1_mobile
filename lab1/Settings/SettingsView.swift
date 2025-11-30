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
        }
    }
    
    @ViewBuilder
    private func buildSectionView() -> some View {
        // Групуємо елементи за орієнтацією
        let grouped = groupByOrientation(viewModel.modules)
        
        ForEach(Array(grouped.enumerated()), id: \.offset) { index, group in
            if group.orientation == .vertical {
                VStack(spacing: 8) {
                    ForEach(Array(group.items.enumerated()), id: \.offset) { _, item in
                        buildModuleView(item)
                    }
                }
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(Array(group.items.enumerated()), id: \.offset) { _, item in
                            buildModuleView(item)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func buildModuleView(_ module: any OrientableModule) -> some View {
        if let settings = module as? Settings {
            buildSettingsItem(settings)
        } else if let helloween = module as? Helloween {
            buildHelloweenItem(helloween)
        }
    }
    
    @ViewBuilder
    private func buildSettingsItem(_ settings: Settings) -> some View {
        if let destination = settings.destination {
            NavigationLink(destination: buildDestination(destination)) {
                settingsContent(settings)
            }
        } else {
            Button(action: {
            }) {
                settingsContent(settings)
            }
        }
    }
    
    @ViewBuilder
    private func settingsContent(_ settings: Settings) -> some View {
        HStack {
            Image(systemName: settings.icon)
                .foregroundStyle(.white)
                .frame(width: 32, height: 32)
                .background(settings.color)
                .cornerRadius(8)
            
            Text(settings.title)
                .foregroundStyle(.primary)
            
            Spacer()
            
            if settings.destination != nil {
                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary)
                    .font(.caption)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
    
    @ViewBuilder
    private func buildHelloweenItem(_ helloween: Helloween) -> some View {
        VStack(spacing: 8) {
            helloween.image
                .resizable()
                .scaledToFill()
                .frame(width: helloween.orientation == .horizontal ? 120 : nil,
                       height: helloween.orientation == .horizontal ? 120 : 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Text(helloween.text)
                .font(.caption)
                .foregroundStyle(.primary)
        }
        .frame(width: helloween.orientation == .horizontal ? 120 : nil)
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
    
    private func groupByOrientation(_ modules: [any OrientableModule]) -> [(orientation: Orientation, items: [any OrientableModule])] {
        var result: [(orientation: Orientation, items: [any OrientableModule])] = []
        var currentGroup: [any OrientableModule] = []
        var currentOrientation: Orientation?
        
        for module in modules {
            if currentOrientation == nil {
                currentOrientation = module.orientation
                currentGroup.append(module)
            } else if currentOrientation == module.orientation {
                currentGroup.append(module)
            } else {
                if let orientation = currentOrientation {
                    result.append((orientation: orientation, items: currentGroup))
                }
                currentOrientation = module.orientation
                currentGroup = [module]
            }
        }
        
        if let orientation = currentOrientation, !currentGroup.isEmpty {
            result.append((orientation: orientation, items: currentGroup))
        }
        
        return result
    }
}
