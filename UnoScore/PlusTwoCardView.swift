//
//  PlusTwoCardView.swift
//  UnoScore
//
//  Created by Romain Poyard on 04/10/2022.
//

import SwiftUI

struct PlusTwoCardView: View {
    var body: some View {
        VStack {
            OneCardsFourView(color: "monJaune")
                .padding(.vertical, -8)
            OneCardsFourView(color: "monJaune")
                .padding(.vertical, -20)
        }
        
    }
}

struct PlusTwoCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlusTwoCardView()
    }
}
