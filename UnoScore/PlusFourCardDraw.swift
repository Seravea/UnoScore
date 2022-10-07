//
//  PlusFourCardDraw.swift
//  UnoScore
//
//  Created by Romain Poyard on 04/10/2022.
//

import SwiftUI

struct PlusFourCardDraw: View {
    
    var body: some View {
        ZStack {
            VStack {
               
                OneCardsFourView(color: "monBleu")
                    .padding(.vertical, -10)
                    
                OneCardsFourView(color: "jauneCarteUno")
                    .padding(.vertical, -10)
                    
            }
            
            
            HStack(spacing: 10) {
                OneCardsFourView(color: "monRouge")
                    
                    
                
               
                OneCardsFourView(color: "monVert")
                    
                    
            }
            
        }
        .frame(width: 100, height: 100)
    }
}

struct PlusFourCardDraw_Previews: PreviewProvider {
    static var previews: some View {
        PlusFourCardDraw()
    }
}

struct OneCardsFourView: View {
    let color: String
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.white)
                    .shadow(radius: 0.1)
                
            })
            .foregroundColor(Color(color))
            .frame(width: 20, height: 35)
            .rotationEffect(.degrees(28))
            .shadow(color: .black ,radius: 0.1, x: 2, y: 1.5)
    }
}
