//
//  ContentView.swift
//  ourAppChallenge1
//
//  Created by lujin mohammed on 27/03/1446 AH.
//
import SwiftUI

struct ContentView: View {
    @AppStorage("hasLaunched") var hasLaunched: Bool = false
    @State private var showAddCatScreen = false
    @State private var cats: [Cat] = []  // Storing cat data
    
    var body: some View {
        VStack {
            if cats.isEmpty {
                firstPage(showAddCatScreen: $showAddCatScreen)
                    .sheet(isPresented: $showAddCatScreen) {
                        page2(cats: $cats)
                    }
            } else {
                homePage(cats: $cats) // Passing the cat array
            }
        }
        .onAppear {
            if !hasLaunched {
                print("First launch")
                hasLaunched = true
            } else {
                print("The app has been launched before")
            }
        }
    }
}

// Preview
#Preview {
    ContentView()
}
