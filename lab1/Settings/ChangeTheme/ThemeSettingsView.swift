import SwiftUI

struct ThemeSettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        Section {
            VStack() {
                ScrollView {
                    Toggle(isOn: $isDarkMode) {
                        Text("Change Theme")
                            .font(.headline)
                            .padding()
                    }
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .buttonBorderShape(.roundedRectangle)
                .padding(.bottom)
            }
        }
    }
}
