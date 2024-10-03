//
//  ghadah.swift
//  ourAppChallenge1
//
//  Created by Ghadah Alhagbani on 28/03/1446 AH.
//

/* import SwiftUI
import Photos
struct ProfileView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil

    var body: some View {
        VStack {
            // Profile Image
            if let selectedImageData,
               let uiImage = UIImage(data: selectedImageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .shadow(radius: 5)
            } else {
                // Default Placeholder when no image is selected
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.gray)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
            
            // Button to select profile picture
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Text("Select Profile Picture")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        // Retrieve selected image data (async)
                        if let data = try? await newItem􀉯?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
        }
        .padding()
        newItem􀉯
        .bounce
    }
}

Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
    
    
    
    
    
Preview {
ghadah()
}
} */
