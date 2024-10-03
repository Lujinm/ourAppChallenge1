//
//  norahi.swift
//  ourAppChallenge1
//
//  Created by nora on 27/03/1446 AH.
//

import SwiftUI
import Charts
struct norahi: View {
    var body: some View {
        VStack() {
            Spacer()
            
            /*Image(systemName: "arrow.backward")
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .padding(.trailing, 350.0)*/
            
            Text("The progress")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.trailing, 150.0)
                .padding(.top, 100.0)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.accent)
                .padding(.bottom, 12.29)
                .shadow(radius: 3)
            
                .frame(width: 370, height: 250)
            
            Spacer()
            ZStack{
                HStack{
                    //icon
                    VStack{
                        //food
                    }
                    //button
                }
            }
            ZStack{
                HStack{
                    //icon
                    VStack{
                        //hydration
                    }
                    //button
                }
            }
            ZStack{
                HStack{
                    //icon
                    VStack{
                        //hydration
                    }
                    //button
                }
            }
                
                
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.accent)
                
                    .frame(width: 370, height: 90)
                    .presentationCornerRadius(300)
                    .shadow(radius: 3)
                
                
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/20.0/*@END_MENU_TOKEN@*/)
                    .fill(Color.accentColor2)
                    .frame(width: 370, height: 90)
                    .presentationCornerRadius(309)
                    .shadow(radius: 3)
                
                
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/20.0/*@END_MENU_TOKEN@*/)
                    .fill(Color.accent)
                    .frame(width: 370, height: 90)
                    .presentationCornerRadius(309)
                    .shadow(radius: 3)
                
                
                
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/20.0/*@END_MENU_TOKEN@*/)
                    .fill(Color.accent)
                    .frame(width: 370, height: 90)
                    .presentationCornerRadius(309)
                    .shadow(radius: 3)
                
                
                
                
                
                
            }
        }
       
    }


#Preview {
    norahi()
}
