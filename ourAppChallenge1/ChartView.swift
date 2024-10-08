//
//  ChartView.swift
//  ourAppChallenge1
//
//  Created by lujin mohammed on 02/04/1446 AH.
//
import SwiftUI
import Charts

struct ChartView: View {
    @State private var isChecked = false
    
    var cat: Cat
    @Binding var cats: [Cat] // Binding to the list of cats
    @State private var mealButtons: [Bool]
    
    init(cat: Cat, cats: Binding<[Cat]>) {
        self.cat = cat
        self._cats = cats
        _mealButtons = State(initialValue: cat.mealButtons) // Initialize with the cat's meal button states
    }
    // Function to calculate food amount based on weight
    func foodAmount() -> String {
            if let weight = Double(cat.weight) {
                return String(format: "%.0fg", weight / 3) // 1/3 of the weight
            }
            return "0g"
        }
    // Progress based on checked meals
        var progress: Double {
            let totalMeals = mealButtons.count
            let completedMeals = mealButtons.filter { $0 }.count
            return totalMeals > 0 ? Double(completedMeals) / Double(totalMeals) : 0
        }
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("The progress")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.trailing, 150.0)
                .padding(.top, 100)
            
            //Frist section
            //Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.accentColor)
                    .padding(.bottom, 12.29)
                    .shadow(radius: 3)
                    .frame(width: 370, height: 250)
                
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
                    Text(cat.weightStatus!) // Cat's weight status
                       .foregroundColor(.orange)
                       .font(.headline)
                       .padding(.bottom, 5)
                    /*Text("cat state")
                        .padding(.trailing, 240.0)
                        .padding(.bottom, 10.0)
                    Text("65%") // Sample progress percentage
                        .padding(.trailing, 240)*/
                    HStack{
                        Text("\(Int(progress * 100))%") // Progress percentage
                                                    .font(.system(size: 50, weight: .bold))
                        Spacer()
                        // Circular progress view based on meals completed
                                                Circle()
                                                    .trim(from: 0.0, to: progress)
                                                    .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                                                    .foregroundColor(.orange)
                                                    .rotationEffect(Angle(degrees: -90))
                                                    .frame(width: 100, height: 100)
                                                    .padding(.trailing, 20)
                    }
                }
                .padding()
            }
            // Meals based on age
            let meals = cat.age.lowercased() == "kitten" ? ["Breakfast", "Lunch", "Dinner", "Hydration", "Activity"] : ["Breakfast", "Dinner", "Hydration", "Activity"]
            
            // Meal buttons
            ForEach(0..<meals.count, id: \.self) { index in
                //first meal
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.accentColor)
                        .frame(width: 370, height: 90)
                        .presentationCornerRadius(300)
                        .shadow(radius: 3)
                    
                    HStack {
                        Image(systemName: index == 0 ? "sun.min" :
                                index == 1 ? "sun.and.horizon" :
                                index == 2 ? "moon.stars.fill" :
                                index == 3 ? "waterbottle.fill" : "progress.indicator")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.leading, 45.0)
                            .frame(width: 40, height: 40)
                        
                        Text(meals[index])
                        // Text("First meal")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("chart 1st color"))
                            .padding(.leading, 30)
                            //.padding(.bottom, 29.0)
                        
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
                                .foregroundColor(mealButtons[index] ? Color(hex: "F24405") : .black)
                                .padding(25)
                                //.padding(.trailing, 20)
                        }
                        //.padding(.trailing, 20)
                    }
                    VStack{
                        Text("Grams:\(foodAmount())")
                            .padding(.top, 30)
                            .padding(.trailing, 135.0)
                    }
                }
            }
        }
    }//vstack mom close
}

// Preview
#Preview {
    ChartView(cat: Cat(name: "Lucy", weight: "9", age: "kitten", imageData: nil, weightStatus: "Overweight", mealButtons: [false, false, false, false, false]), cats: .constant([Cat(name: "Lucy", weight: "9", age: "Kitten", imageData: nil, weightStatus: "overweight", mealButtons: [false, false, false, false, false])]))
}
