//
//  lujin.swift
//  ourAppChallenge1
//
//  Created by lujin mohammed on 27/03/1446 AH.
//

import SwiftUI
import PhotosUI

struct lujin: View {
@State private var selectedItem: PhotosPickerItem? = nil
@State private var selectedImageData: Data? = nil

@State var Name: String = ""
@State var Weight: String = ""
@State var Age: String = ""
    
    @State var selected = 0
    @State var selectedSex: String=""
    
    let sex:[String]=[
            "kitten",
            "adult" ]

var body: some View {
    
    VStack (spacing:30){
        Spacer()
        //profile image
       if let selectedImageData,
           let uiImage = UIImage(data: selectedImageData){
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
               .frame(width: 150, height:160)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
        }else{
            // Default Placeholder when no image is selected
            Image(systemName:"person.crop.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 160)
                .foregroundColor(.gray)
                .clipShape(Circle())
        }
        // Button to select profile picture
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()) {
                Text("Select Profile Picture")
                    .frame(width:160, height: 20)
                    .padding()
                    .background(Color.myOrange)
                   .cornerRadius(18)
            }
            .onChange(of: selectedItem) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
            
        //cetion1 code
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.accent)
                .frame(width: 380, height:300)
                .shadow(radius: 3)
            //enter data start here
            VStack {
                HStack (spacing:30) {
                    Text("Cat's Name")
                    TextField("Enter your cat's name", text:$Name)
                }
                Divider()
                HStack (spacing:21){
                    Text("Cat's Weight")
                    TextField("Enter your cat's weight", text:$Weight)
                }
                Divider()
                //age roller
                        Group{
                        Text("your cat age '\(selectedSex)'")
                                .padding()
                            Picker("choose your cat sex", selection: $selectedSex){
                                ForEach(sex, id: \.self) {sex in Text(sex)}}
                            .pickerStyle(.segmented)
                        }
              //  Spacer()
            }
            .padding()
        }
        Spacer()
    }
}
}

// Preview
struct ProfileView_Previews: PreviewProvider {
static var previews: some View {
lujin()
}
}
#Preview {
lujin()
}
