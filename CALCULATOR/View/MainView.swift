//
//  MainView.swift
//  CALCULATOR
//
//  Created by Armen Sukiasyan on 05.03.24.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            //MARK: Background
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 12) {
                Spacer()
                
                HStack {    //MARK: Display
                    Spacer()
                    Text(viewModel.value)
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .padding(.horizontal, 28)
                }
                
                //Mark: Buttons
                ForEach(viewModel.buttonsArray, id: \.self) { row in  //func
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                viewModel.didTap(item: item)  //func
                            } label: {
                                Text(item.rawValue)
                                    .frame(
                                        width: viewModel.buttonWidth(item: item),
                                        height: viewModel.buttonHeigth())
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
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}



/*
 Inche MVVM-y
 Da filer-i chisht dasavorman dzev e:
 Baxkacac e ereq bajinneric`
 1.View-ic vortex artabervum e ekrany aysinqn aystex petqe pahel miay VIEW
 2.Model vortex pahvum e Business Logikan` Data-n` inchvor tvyalner
 3.ViewModel-y vori mijocov katarvum e Model-i ev View-i mijev Kapy [Model + View # ViewModeli-i mijocov]
 Inche ayd procesy` Model, vory uni tvyalner data ayd tvyalnery yngnum en ViewModel, vory ir hertin` methodnerov, functionnerov, hatkutyunnerov(property) abrabotka e anum ayd tvyalnery(data) ev naxapatrastum e dranq View-um ogtagorcman: View-n irenum arka `1 property-i mijocov durs e berum ayd tvyalnery(data) ViewModel-ic ev texadrum dranq hamapatasxan texerum: FINISH !!!
 */

/*
 Stexcecinq @EnvironmentObject property ev talis enq VieModel-i hnaravorutyunnery ev ayd funkcionaly ogtagorcum enq mer View-nerum` Text-um Button-um irenc func-ional harvacnerum
 
 */
