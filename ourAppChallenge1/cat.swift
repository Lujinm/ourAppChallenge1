//
//  cat.swift
//  ourAppChallenge1
//
//  Created by lujin mohammed on 02/04/1446 AH.
//

import Foundation
import SwiftUI


struct Cat: Identifiable, Codable {
    var id = UUID() // معرف فريد لكل قطة
    var name: String
    var weight: String
    var age: String
    var imageData: Data? // بيانات الصورة للقط (اختياري)
    var weightStatus: String? // حالة الوزن (اختياري)
    var mealButtons: [Bool] = [false, false, false, false, false]
}
