//
//  ChartView.swift
//  ourAppChallenge1
//
//  Created by lujin mohammed on 02/04/1446 AH.
//
import SwiftUI
import Charts

struct ChartView: View {
    var cat: Cat
    @Binding var cats: [Cat] // Binding to the list of cats
    @State private var mealButtons: [Bool]
    
    init(cat: Cat, cats: Binding<[Cat]>) {
        self.cat = cat
        self._cats = cats
        self._mealButtons = State(initialValue: cat.mealButtons) // Initialize with the cat's meal button states
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("The progress")
                .font(.largeTitle)
                .bold()
                .padding(.top, 100)
            
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.accentColor)
                    .frame(width: 370, height: 250)
                    .shadow(radius: 3)
                VStack(alignment: .leading) {
                    HStack {
                        if let imageData = cat.imageData, let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                        }
                        Text(cat.name)
                            .padding(.bottom, 120)
                            .padding(.leading, 10.0)
                    }
                    Text("65%") // Sample progress percentage
                }
            }
            
            // Meals based on age
            let meals = cat.age.lowercased() == "kitten" ? ["Breakfast", "Lunch", "Dinner", "Hydration"] : ["Breakfast", "Dinner", "Hydration"]
            
            // Meal buttons
            ForEach(0..<meals.count, id: \.self) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.accentColor)
                        .frame(width: 370, height: 90)
                        .shadow(radius: 3)
                    
                    HStack {
                        Text(meals[index])
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                        
                        Spacer()
                        
                        Button(action: {
                            mealButtons[index].toggle() // Toggle the button state
                            if let catIndex = cats.firstIndex(where: { $0.id == cat.id }) {
                                cats[catIndex].mealButtons = mealButtons // Update the cat's meal button states in the array
                            }
                        }) {
                            Image(systemName: mealButtons[index] ? "checkmark.circle.fill" : "circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(mealButtons[index] ? .orange : .black)
                        }
                        .padding(.trailing, 20)
                    }
                }
                .padding(.vertical, 5)
            }
        }
        .padding(.bottom)
    }
}

// Preview
#Preview {
    ChartView(cat: Cat(name: "Sample Cat", weight: "6", age: "adult", imageData: nil, weightStatus: "Overweight", mealButtons: [false, false, false]), cats: .constant([Cat(name: "Sample Cat", weight: "6", age: "adult", imageData: nil, weightStatus: "Overweight", mealButtons: [false, false, false])]))
}
