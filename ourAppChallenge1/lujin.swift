//
//  lujin.swift
//  ourAppChallenge1
//
//  Created by lujin mohammed on 27/03/1446 AH.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    var body: some View {
        VStack{
            //profile image
          /*  if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData){
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                   .frame(width: 150, height:160)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            }else{
                // Default Placeholder when no image is selected
                Image(systemName:"person.crop.circle.fill.badge.plus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 160)
                    .foregroundColor(.gray)
                    .clipShape(Circle())
            }*/
            // Button to select profile picture
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Image(systemName:"person.crop.circle.fill.badge.plus")
                        .frame(width: 150, height: 160)
                    //Text("Select Profile Picture")
                       // .font(.headline)
                        .padding()
                        .background(Color.black)
                       // .foregroundColor(.white)
                       // .cornerRadius(15)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        // Retrieve selected image data (async)
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
        }
        .padding()
    }
}

// Preview
struct ProfileView_Previews: PreviewProvider {
static var previews: some View {
ProfileView()
}
}



struct lujin: View {
    /*@State let var weight: Int = 0
     if weight==4 || weight==5 {
     print("normal weight")
     }
     else if weight>5 {
     print("Number is negative")
     }
     else if weight<4 {
     print("under weight")
     }*/
/*let sex:[String]=[
        "female",
        "male" ]
    
    @State private var selectedSex: String=""
    */
    //@State var selected = 0
    var body: some View {
        @State var Name: String = ""
        @State var Weight: String = ""
        @State var Age: String = ""
        
        let sex:[String]=[
                "female",
                "male" ]
            
            @State var selectedSex: String=""
        
        VStack{
            ProfileView()
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.accent)
                .frame(width: 380, height: 180)
                .shadow(radius: 3)
                .padding(.bottom, 32.0)
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.accent)
                .frame(width: 380, height: 195)
            .shadow(radius: 3) }
        
        ZStack{
            Text("Name")
                .padding(.bottom, 50.0)
                .offset(x: -153, y:-400)
            TextField("Enter youe cat's name", text:$Name)
                .offset(x: 82, y:-425)
            Divider()
                .offset(x: -19, y:-400)
                .frame(width: 300)
            
            
            Text("Weight")
                .multilineTextAlignment(.leading)
                .padding(.bottom, -500.0)
                .offset(x: -146, y:-380)
            TextField("Enter youe cat's weight", text:$Weight)
                .offset(x: 90, y:-370)
            Divider()
                .offset(x: -19, y:-350)
                .frame(width: 300)
            
            
            Text("Age")
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(.bottom, -500.0)
                .foregroundColor(.black)
                .offset(x: -153, y:-330)
            TextField("Enter youe cat's age", text:$Age)
                .offset(x: 75, y:-317)
            Divider()
                .offset(x: -19, y:-300)
            .frame(width: 300) }

        /*VStack{
            Picker(selection: @selected, label: Text("Picker"), content: {
                Text("female").tag(1)
                Text("male").tag(2)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            if selected==1{
                print("lujin")
            }
            else{
                print("lala")
            }
            
        }*/
    ZStack {
            Group{
            Text("selecteyour cat sex \(selectedSex)")
                    .offset(x: -2, y:-280)
                Picker("choose your cat sex", selection: $selectedSex) {
                    ForEach(sex, id: \.self) {sex in Text(sex)}}
                .pickerStyle(.segmented)
                .offset(x: -2, y:-250)
                //Text("Uterine condition")
            }}
        }
        }
#Preview {
    lujin()
}
