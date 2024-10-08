//
//  homePage.swift
//  ourAppChallenge1
//
//  Created by lujin mohammed on 02/04/1446 AH.
//




import SwiftUI

struct homePage: View {
    @Binding var cats: [Cat] // Binding to the list of cats
    @State private var isAddingCat = false // For showing add cat screen
    @State private var selectedCat: Cat? = nil // For opening ChartView
    
    var body: some View {
        NavigationView {
            VStack (spacing: 20) {
                Text("My Cats")
                    .font(.largeTitle)
                    .padding()
                
                // List of added cats
                List(cats) { cat in
                    Button(action: {
                        selectedCat = cat
                    }) {
                        VStack(alignment: .leading) {
                            Text(cat.name)
                                .font(.headline)
                            Text("Weight: \(cat.weight) kg")
                            Text("Status: \(cat.weightStatus)")
                        }
                    }
                }

                Spacer()

                // Add more cats button
                Button(action: {
                    isAddingCat = true
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.orange)
                        Text("Add more cats")
                            .font(.title2)
                    }
                    .padding()
                }
            }
            .navigationTitle("My Cats")
            .sheet(isPresented: $isAddingCat) {
                page2(cats: $cats) // Pass the cats array to the add page
            }
            .sheet(item: $selectedCat) { cat in
                ChartView(cat: cat, cats: $cats) // Pass the selected cat to ChartView
            }
        }
    }
}

// Preview
#Preview {
    homePage(cats: .constant([]))
}
