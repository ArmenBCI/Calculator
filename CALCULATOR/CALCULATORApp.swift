//
//  CALCULATORApp.swift
//  CALCULATOR
//
//  Created by Armen Sukiasyan on 05.03.24.
//

import SwiftUI

@main
struct CALCULATORApp: App {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
// hima teseq te menq inch katarecinq ays gorcoxutyunnery hima menq stexceinq property ev qani vor sa ayn glxavor cucadrelu hatvacn e menq grelov ays code-y menq properti viewModel talis enq eraxik dzevov depi nerqev: Hima bolor obyektnery voronq dasavorvac en erxariayov stanalu en uvidamleniyaner mer viewModel-um texi unecox popoxutyunneri verabryal ev hiam bolory ovqer gtnvum en mer WindowGroup { . . . } -um irenq hnaravorutyun en stanalu hamagorcakcel ViewModel-i het dra hamar menq stexcecin property @State var viewModel-y:

//Amenahesht Dzevy ViewModel-y + Modely + View = irar kapelu da ays dzevn e 
