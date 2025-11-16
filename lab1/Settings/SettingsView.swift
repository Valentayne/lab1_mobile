import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink(destination: GeneralSettingsView()) {
                        HStack {
                            Image(systemName: "gear")
                                .foregroundStyle(.blue)
                            Text("Загальні налаштування")
                        }
                    }
                    
                    NavigationLink(destination: ThemeSettingsView()) {
                        HStack {
                            Image(systemName: "paintbrush.fill")
                                .foregroundStyle(.purple)
                            Text("Змінити тему")
                        }
                    }
                }
            }
            .navigationTitle("Налаштування")
        }
    }
}
