//
//  ConvertedUnit.swift
//  Challange1-Conversions
//
//  Created by Ting Becker on 5/29/21.
//

import Foundation
// LENGTH CONVERSION


// Converted based on choice
enum Convertedunit: Double, CaseIterable {
    case Meters
    case Foot
    case Yard
    case Miles
    
    func converted(from baseunit: Baseunit) -> Double{
        switch baseunit {
        case .Meters:
            return self.rawValue * 0.001
        case .Foot:
            return self.rawValue * 0.00328084
        case .Yard:
            return self.rawValue * 0.00109361
        case .Miles:
            return self.rawValue * 0.00000062137
        }
    }
}
