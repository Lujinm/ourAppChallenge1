//
//  lujin2.swift
//  ourAppChallenge1
//
//  Created by lujin mohammed on 02/04/1446 AH.
//
import SwiftUI
import PhotosUI

struct page2: View {
    @Binding var cats: [Cat] // ربط البيانات مع الصفحة الرئيسية
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    @State var name: String = ""
    @State var weight: String = ""
    @State var selectedAge: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    let ageOptions: [String] = ["Kitten", "Adult"]
    
    var body: some View {
        NavigationView{
        VStack(spacing: 30) {
            Spacer()
            // عرض صورة الملف الشخصي
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 160)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 160)
                    .foregroundColor(.gray)
                    .clipShape(Circle())
            }
            // زر لاختيار صورة الملف الشخصي
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Text("Select Profile Picture")
                        .frame(width: 160, height: 20)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(18)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
            
            // إدخال بيانات القطة
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.accentColor)
                    .frame(width: 380, height: 300)
                    .shadow(radius: 3)
                
                VStack(spacing: 13) {
                    HStack(spacing: 30) {
                        Text("Cat's Name")
                        TextField("Enter your cat's name", text: $name)
                    }
                    Divider()
                    HStack(spacing: 21) {
                        Text("Cat's Weight")
                        TextField("Enter your cat's weight", text: $weight)
                            .keyboardType(.decimalPad)
                    }
                    Divider()
                    
                    // اختيار عمر القطة
                    Group {
                        Text("Your cat is: \(selectedAge)")
                            .padding()
                        Picker("Choose your cat age", selection: $selectedAge) {
                            ForEach(ageOptions, id: \.self) { age in
                                Text(age)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Spacer()
                }
                .padding()
            }
            
            Spacer()
        }
        .navigationTitle("Add Cat")
        .toolbar{
            ToolbarItem(placement: .cancellationAction){
                Button("Cancel"){
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.orange)
            }
            ToolbarItem(placement: .confirmationAction){
                Button("Save"){
                    let weightValue = Double(weight) ?? 0.0
                    var weightStatus: String
                    
                    if weightValue < 4 {
                        weightStatus = "Underweight"
                    } else if weightValue <= 5 {
                        weightStatus = "Normal"
                    } else {
                        weightStatus = "Overweight"
                    }
                    
                    let newCat = Cat(name: name, weight: weight, age: selectedAge, imageData: selectedImageData, weightStatus: weightStatus)
                    cats.append(newCat) // إضافة القطة إلى المصفوفة
                    presentationMode.wrappedValue.dismiss() // إغلاق الشاشة بعد الحفظ
                }
                .foregroundColor(.orange)
                .bold()
            }
        }
    }
}
}
// Preview
#Preview {
    page2(cats: .constant([]))
}
