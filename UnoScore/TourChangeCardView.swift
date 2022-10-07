//
//  TourChangeCardView.swift
//  UnoScore
//
//  Created by Romain Poyard on 05/10/2022.
//

import SwiftUI

struct TourChangeCardView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center) {
                HStack {
                    VStack {
                        
                        Image(systemName: "arrowshape.turn.up.right.fill")
                            .foregroundColor(Color("monJaune"))
                            .rotationEffect(.degrees(-90))
                            .padding(-14)
                        .shadow(color: .black ,radius: 0.1, x: 1, y: -1)
                        Spacer()
                    }
                    .frame(height: 63)
                    
                        
                    Image(systemName: "arrowshape.turn.up.right.fill")
                        .foregroundColor(Color("monJaune"))
                        .rotationEffect(.degrees(90))
                        .padding(-14)
                        .shadow(color: .black ,radius: 0.1, x: 1, y: -1)
                
                }
                
                .rotationEffect(.degrees(65))
                .font(.system(size: 40).weight(.bold))
                Spacer()
                Spacer()
                Spacer()
            }
            .frame(width: 63, height: 63)
            
        }
        .frame(width: 63, height: 63)
        
    }
}

struct TourChangeCardView_Previews: PreviewProvider {
    static var previews: some View {
        TourChangeCardView()
    }
}
