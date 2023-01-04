//
//  CardCellView.swift
//  UnoScore
//
//  Created by Romain Poyard on 02/09/2022.
//

import SwiftUI

struct CardCellView: View {
    var card: Card
    @ObservedObject var viewModel: ViewModel
    
    @State var number: Int = 0
    
    var body: some View {
        ZStack {
     
                Image(card.name)
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 3)

            
            
            VStack {
                if number > 0 {
                    
                    
                HStack {
                    Spacer()
                    Text("\(number) carte\(number > 1 ? "s" : " ")")
                        .padding(1)
                            .foregroundColor(.red)
                            
                            .animation(.default, value: number)
                        .font(.custom("CabinCondensed-Bold", size: 17))
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .frame(width: 80 )
                        )
                        
                    
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .padding(7)
                    
                
                Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    
                    Button {
                        if number > 0 {
                            number -= 1
                            card.totalPoint -= card.points
                        }
                        
                        
                    }label: {
                        
                        
                        Image(systemName: "minus.circle.fill")
                        
                            .font(.system(size: 40))
                            .symbolRenderingMode(.multicolor)
                        
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Button {
                        number += 1
                        card.totalPoint += card.points
                       
                        
                    }label: {
                        
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 40))
                            .symbolRenderingMode(.multicolor)
                    }
                    
                    Spacer()
                }
            } // end Vstack
        }// end Zstack
        .shadow(radius: 1)
        .onAppear {
            number = 0
        }
    }
}


struct CardCellView_Previews: PreviewProvider {
    static var previews: some View {
        CardCellView(card: Card.plusFour, viewModel: ViewModel(), number: 0)
    }
}
