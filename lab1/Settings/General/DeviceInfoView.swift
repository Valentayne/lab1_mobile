import SwiftUI

struct DeviceInfoView: View {
    var body: some View {
        List {
            Section("Інформація про пристрій") {
                HStack {
                    Text("Модель")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(UIDevice.current.model)
                }
                
                HStack {
                    Text("Система")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)")
                }
                
                HStack {
                    Text("Назва пристрою")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(UIDevice.current.name)
                }
            }
        }
        .navigationTitle("Про пристрій")
        .navigationBarTitleDisplayMode(.inline)
    }
}
