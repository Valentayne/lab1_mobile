//
//  MainTabView.swift
//  lab1
//
//  Created by Валентин Єгоян on 13.11.2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Головна", systemImage: "house.fill")
                }

            SearchView()
                .tabItem {
                    Label("Пошук", systemImage: "magnifyingglass")
                }
        }
    }
}
