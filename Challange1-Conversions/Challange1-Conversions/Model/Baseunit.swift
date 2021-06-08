//
//  Baseunit.swift
//  Challange1-Conversions
//
//  Created by Ting Becker on 5/29/21.
//

import Foundation
// LENGTH CONVERSION


// Baseunit is millimeters (lowest common denominator)
enum Baseunit: String, CaseIterable, Identifiable {
    case Meters
    case Foot
    case Yard
    case Miles
    
    var id: Baseunit { self }
    
//    func convertToMillimeters(from unit: Baseunit) -> Double{
//        switch unit {
//        case .Meters:
//            return self.rawValue * 1000
//        case .Foot:
//            return self.rawValue * 304.8
//        case .Yard:
//            return self.rawValue * 914.4
//        case .Miles:
//            return self.rawValue * 0.000001609
//        }
//    }
}
