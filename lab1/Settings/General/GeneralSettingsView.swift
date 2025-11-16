import SwiftUI

struct GeneralSettingsView: View {
    var body: some View {
        List {
            NavigationLink(destination: DeviceInfoView()) {
                HStack {
                    Image(systemName: "info.circle")
                        .foregroundStyle(.green)
                    Text("Про пристрій")
                }
            }
        }
        .navigationTitle("Загальні налаштування")
        .navigationBarTitleDisplayMode(.inline)
    }
}
