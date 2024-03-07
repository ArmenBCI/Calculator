//
//  ViewModel.swift
//  CALCULATOR
//
//  Created by Armen Sukiasyan on 07.03.24.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    //MARK: Properties
    @Published var value = "0"                           //Displey mutqi tver
    @Published var number: Double = 0.0                  //
    @Published var currentOperation: Operation = .none   //
    
    let buttonsArray: [[Buttons]] = [
        [.clear, .negativ, .precent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimail, .equal]
    ]
    
    //MARK: Tap Button Method - Կտտացրեք կոճակի մեթոդը func vory katarum e bolor hashvarkox operacianery
     func didTap(item: Buttons) {
         switch item {
         case .plus, .minus, .multiple, .divide:
             currentOperation = item.buttonToOperation()
             number = Double(value) ?? 0
             value = "0"
             //-> continue
             
 //        case .plus:  // all remove becouse universal func
 //            currentOperation = .addition
 //            number = Double(value) ?? 0
 //            value = "0"
 //        case .minus: the same
 //        case .multiple: the same
 //        case .divide: the same
             
            //-> continue
         case .equal:
             if let currentValue = Double(value) {
                 value = formatResult(performOperation(currentValue))
             }
         case .decimail:
             if !value.contains(".") {
                 value += "."
             }
         case .precent:
             if let currentValue = Double(value) {
                 value = formatResult(currentValue / 100)
             }
         case .negativ:
             if let currentValue = Double(value) {
                 value = formatResult(-currentValue)
             }
         case .clear:
            value = "0"
         default:
             if value == "0" {
                 value = item.rawValue
             } else {
                 value += item.rawValue
             }
         }
     }
     
     
     //MARK: Helper calculate method - հաշվարկման մեթոդ vory ognum e te tveri het oinch operacia petqe katarvi + - * /
     func performOperation(_ currentValue: Double) -> Double {
         switch currentOperation {
         case .addition:
             return number + currentValue
         case .subtract:
             return number - currentValue
         case .multiyply:
             return number * currentValue
         case .divide:
             return number / currentValue
         default:
            return currentValue
         }
     }
     
     
     //MARK: Remove last zero method
     func formatResult(_ result: Double) -> String {
         return String(format: "%g", result)
     }
     
     
     
     //MARK: Size of Buttons Methods
     func buttonWidth(item: Buttons) -> CGFloat {  //
         let spacing: CGFloat = 12
         let totalSpacing: CGFloat = 5 * spacing
         let zeroTotalSpacing: CGFloat = 4 * spacing
         let totalColums: CGFloat = 4
         let screenWidth: CGFloat = UIScreen.main.bounds.width //sa ekrani laynutyunn e!!!!!!
         if item == .zero {
             return (screenWidth - zeroTotalSpacing) / totalColums * 2
         }
         return (screenWidth - totalSpacing) / totalColums
     }
     //CGFloat-y da kordinatayin chapman miavor e pixselnerov pointnerov [1-pointa da 9-pixele!!!!]
     
     func buttonHeigth() -> CGFloat {
         let spacing: CGFloat = 12
         let totalSpacing: CGFloat = 5 * spacing
         let totalColums: CGFloat = 4
         let screenWidth: CGFloat = UIScreen.main.bounds.width
         return (screenWidth - totalSpacing) / totalColums
     }
}

// Hima inch popoxutyun exav mer ViewModelum kapvac funcional-i het apa ayn poxvelu e naev View-um
