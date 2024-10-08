//
//  new.swift
//  ourAppChallenge1
//
//  Created by nora on 30/03/1446 AH.
//

import SwiftUI

struct HomeScreen: View {
    @Binding var cats: [Cat]
    @State private var showAddCatScreen = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // عنوان الصفحة وزر الإضافة
                HStack {
                    Text("My cats")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    Button(action: {
                        showAddCatScreen = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color.orange)
                            .font(.system(size: 30))
                    }
                }
                .padding(.horizontal)
                
                // عرض القطط المدخلة
                ScrollView {
                    ForEach(cats) { cat in
                        ZStack {   NavigationLink(destination: ChartView(cat: cat, cats: $cats)){
                            RoundedRectangle(cornerRadius: 20)
                               // .fill(Color( colorLiteral(red: 0.996, green: 0.969, blue: 0.925, alpha: 1)))
                                .frame(height: 140)
                                .shadow(radius: 3)
                        }
                            HStack {
                                if let imageData = cat.imageData, let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .padding(.leading, 10)
                                } else {
                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .padding(.leading, 10)
                                }
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(cat.name)
                                        .font(.title2)
                                        .bold()
                                    
                                    Text("Status: \(cat.weightStatus ?? "Unknown")")
                                        .foregroundColor(cat.weightStatus == "Overweight" ? .red : .gray)
                                    
                                    Text("Weight: \(cat.weight) kg")
                                    Text("Age: \(cat.age)")
                                }
                                .padding(.leading, 10)
                                
                                Spacer()
                                
                                
                                
                            }
                            .padding(.vertical, 10)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .sheet(isPresented: $showAddCatScreen) {
                page2(cats: $cats)
            }
        }
    }
}

// Preview
#Preview {
    HomeScreen(cats: .constant([Cat(name: "Lucy", weight: "6", age: "2 years", weightStatus: "Overweight"), Cat(name: "Nola", weight: "6", age: "2 years", weightStatus: "Underweight")]))
}

