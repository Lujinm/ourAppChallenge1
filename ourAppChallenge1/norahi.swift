import SwiftUI
import Charts

struct norahi: View {
    @State private var isChecked = false //for the check
    //@Binding var Name: String
    var body: some View {
        VStack {
            
            Text("The progress")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.trailing, 150.0)
                .padding(.top, 100.0)
            //Frist section
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.accent)
                    .padding(.bottom, 12.29)
                    .shadow(radius: 3)
                    .frame(width: 370, height: 250)
                
                VStack{
                    HStack{
                        Text("Cat name")
                      //  Text($Name)
                    }
                    
                        //.padding(.trailing, 50.0)
                        
                    
                    Text("cat state")
                        .padding(.trailing, 240.0)
                        .padding(.bottom, 10.0)
                        
                    Text("progress %")
                        .padding(.trailing, 240.0)
                        
                    
                    
                    
                }
            }
            Spacer()
            //first meal
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.accent)
                    .frame(width: 370, height: 90)
                    .presentationCornerRadius(300)
                    .shadow(radius: 3)
                
                HStack {
                    Image(systemName: "sun.min")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.leading, 45.0)
                        .frame(width: 40, height: 40)
                    
                    
                    Text("First meal")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("chart 1st color"))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 30.0)
                        .padding(.bottom, 29.0)
                    
                    
                    Spacer()
                    Button(action: {
                        isChecked.toggle()
                    }) {
                        Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(isChecked ? Color(hex: "F24405") : .black)
                            .padding(25)
                    }
                }
                
                VStack{
                    Text("Grams amount")
                    
                        .padding(.top, 30)
                        .padding(.trailing, 135.0)
                    
                }
                
                
                .padding()
            }
            
            //second meal
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.accent)
                    .frame(width: 370, height: 90)
                    .presentationCornerRadius(300)
                    .shadow(radius: 3)
                
                HStack {
                    Image(systemName: "sun.and.horizon")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.leading, 60.0)
                        .frame(width: 30, height: 30)
                    
                    Text("Second meal")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("chart 1st color"))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 39.0)
                        .padding(.bottom, 29.0)
                    
                    
                    
                    Spacer()
                    Button(action: {
                        isChecked.toggle()
                    }) {
                        Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)                             .foregroundColor(isChecked ? Color(hex: "F24405") : .black)
                            .padding(25)
                    }
                }
                
                VStack{
                    Text("Grams amount")
                    
                        .padding(.top, 30)
                        .padding(.trailing, 129.0)
                    
                    
                }
                
                
                .padding()
            }
            
            //third meal
           
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.accent)
                    .frame(width: 370, height: 90)
                    .presentationCornerRadius(300)
                    .shadow(radius: 3)
                
                HStack {
                    Image(systemName: "moon.stars")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        //.foregroundColor(Color.black)
                        .padding(.leading, 60.0)
                        .frame(width: 40, height: 40)
                    
                    
                    
                    Text("Third meal")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("chart 1st color"))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 30.0)
                        .padding(.bottom, 29.0)
                        
                    
                    
                    
                    Spacer()
                    Button(action: {
                        isChecked.toggle()
                    }) {
                        Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40) // تحديد حجم الزر
                            .foregroundColor(isChecked ? Color(hex: "F46B07") : .black)
                            .padding(25)
                    }
                }
                
               
                VStack{
                    Text("Grams amount")
                    
                        .padding(.top, 30)
                        .padding(.trailing, 129.0)
                    
                    
                }
                
                .padding()
            }
            //third meal
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.accent)
                    .frame(width: 370, height: 90)
                    .presentationCornerRadius(300)
                    .shadow(radius: 3)
                
                HStack {
                    Image(systemName: "waterbottle.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.leading, 60.0)
                        .frame(width: 40, height: 40)
                    
                    
                    
                    Text("Hydration")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("chart 2nd color 1"))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 39.0)
                        
                    
                    
                    
                    Spacer()
                    Button(action: {
                        isChecked.toggle()
                    }) {
                        Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40) // تحديد حجم الزر
                            .foregroundColor(isChecked ? Color(hex: "F46B07") : .black)
                            .padding(25)
                    }
                }
                
                VStack{
                    Text("")
                    
                        .padding(.top, 30)
                        .padding(.trailing, 129.0)
                    
                    
                }
                
                
                .padding()
            }
            //hydration
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.accent)
                    .frame(width: 370, height: 90)
                    .presentationCornerRadius(300)
                    .shadow(radius: 3)
                
                HStack {
                    Image(systemName: "progress.indicator")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.leading, 60.0)
                        .frame(width: 40, height: 40)
                    
                    
                    
                    Text("Activity")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("chart 3rd color 2"))
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 39.0)
                        
                    
                    
                    
                    Spacer()
                    Button(action: {
                        isChecked.toggle()
                    }) {
                        Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)                              .foregroundColor(isChecked ? Color(hex: "F28705") : .black)
                            .padding(25)
                    }
                }
                
                VStack{
                    Text("")
                    
                        .padding(.top, 30)
                        .padding(.trailing, 129.0)
                    
                    
                }
                
                
                .padding()
            }
            //activity
            
            
            
            
            
            
            
        }
        
    
            
           
        
        
        
        
        
        
    }
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = scanner.string.startIndex

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

#Preview {
    norahi()
}
