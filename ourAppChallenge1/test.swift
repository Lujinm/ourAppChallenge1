//
//  test.swift
//  ourAppChallenge1
//
//  Created by lujin mohammed on 30/03/1446 AH.
//
import SwiftUI
/* @State var weight: Int = 0
 if weight>5 {
 print("over weight")
 }
 else if weight<4  {
 print("under weight")
 }
 else{
 print("normal weight")
 }*/
struct test: View {
    @State var selected = 0
    @State var selectedSex: String=""
    
    let sex:[String]=[
            "female",
            "male" ]
    
    var body: some View {
        Text("lujin")
        
       
        VStack{
          /*  Picker(selection: @selected, label: Text("Picker"), content: {
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
            */
        }
    ZStack {
            Group{
            Text("your cat sex '\(selectedSex)'")
                    .offset(x: -2, y:-280)
                Picker("choose your cat sex", selection: $selectedSex) {
                    ForEach(sex, id: \.self) {sex in Text(sex)}}
                .pickerStyle(.segmented)
                .offset(x: -2, y:-250)
            }}
    }
}

#Preview {
    test()
}
