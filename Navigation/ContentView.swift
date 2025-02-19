//
//  ContentView.swift
//  Navigation
//
//  Created by Seth Barnard on 2/19/25.
//

import SwiftUI

struct ContentView: View {
    @State private var pathStore = PathStore()

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0, pathStore: $pathStore)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, pathStore: $pathStore)
                }
        }
    }
}

struct DetailView: View {
    var number: Int
    @Binding var pathStore: PathStore
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationLink("Go to Random Number(detail)", value: Int.random(in: 1...1000))
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Home") {
                    pathStore.reset()
                }
            }
    }
}

#Preview {
    ContentView()
}
