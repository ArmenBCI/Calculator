//
//  Model.swift
//  CALCULATOR
//
//  Created by Armen Sukiasyan on 05.03.24.
//

import SwiftUI

enum Buttons: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case plus = "+"
    case minus = "-"
    case multiple = "x"
    case divide = "/"
    case equal = "="
    case decimail = "."
    case precent = "%"
    case negativ = "+/-"
    case clear = "AC"
    
    var buttonColor: Color {
        switch self { //sa nshanakum e vor menq ciklov stugum enq anum mer button-i elementnery` henc ira vrov
        case .clear, .negativ, .precent:
            return Color.ColorBac
        case .divide, .multiple, .minus, .plus, .equal:
            return Color.ColorOrang
        default:
            return Color.Color9
        }
    }
    
    
    
    var buttonFontColor: Color {
        switch self {
        case .clear, .negativ, .precent:
            return Color.black
        default:
            return Color.white
        }
    }
}
