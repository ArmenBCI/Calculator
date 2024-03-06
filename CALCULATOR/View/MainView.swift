//
//  MainView.swift
//  CALCULATOR
//
//  Created by Armen Sukiasyan on 05.03.24.
//

import SwiftUI

struct MainView: View {
    //MARK: Property
    let buttonsArray: [[Buttons]] = [
        [.clear, .negativ, .precent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimail, .equal]
        ]
    
    var body: some View {
        ZStack {
            //MARK: Background
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 12) {
                Spacer()
                
                HStack {    //MARK: Display
                    Spacer()
                    Text("0")
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .padding(.horizontal, 28)
                      
                }
                
                //Mark: Buttons
                ForEach(buttonsArray, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                //
                            } label: {
                                Text(item.rawValue)
                                    .frame(
                                 width: self.buttonWidth(item: item),
                                 height: self.buttonHeigth())
                                    .font(.system(size: 30))
                                    .fontWeight(.bold)
                                    .foregroundColor(item.buttonFontColor)
                                    .background(item.buttonColor)
                                    .cornerRadius(40)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
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

#Preview {
    MainView()
}
