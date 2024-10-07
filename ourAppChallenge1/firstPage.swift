//
//  firstPage.swift
//  ourAppChallenge1
//
//  Created by lujin mohammed on 02/04/1446 AH.
//

import SwiftUI

struct firstPage: View {
    @Binding var showAddCatScreen: Bool  // استقبال المتغير كـ Binding من ContentView
    @AppStorage("hasLaunched") var hasLaunched: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 210) {
                Text("my cats")
                    .font(.largeTitle)
                    .bold()

                Button(action: {
                    showAddCatScreen = true  // تغيير القيمة لفتح شاشة إضافة القطط
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color.orange)
                        .frame(width: 50, height: 50)
                }
            }

            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.accentColor)
                    .frame(width: 380, height: 180)
                    .shadow(radius: 3)

                Text("click + to add your cat")
                    .font(.title2)
                    .foregroundColor(Color.orange)
            }
        }
        Spacer()
    }
}

// Preview
#Preview {
    firstPage(showAddCatScreen: .constant(false))  // استخدام constant للقيمة الافتراضية في الـ Preview
}
