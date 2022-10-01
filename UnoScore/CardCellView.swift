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
    
    func addScore(card: Card, user: User) {
        
    }
    
    @State var number: Int = 0
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 150)
                .background(
                    RoundedRectangle(cornerRadius: 13)
                        .frame(width: 110, height: 160)
                        .foregroundColor(.white)
                        .shadow(radius: 1)
                       
                )
                
                
                
            Ellipse()
                .frame(width: 75, height: 115)
                .foregroundColor(Color("monRouge"))
                .rotationEffect(.degrees(41))
            if card.name.count <= 2 {
                Text(card.name)
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(Color("monJaune"))
            }else if card.name == "ChangeColor" {
                Text("Couleur")
                    .bold()
                    .foregroundColor(Color("monJaune"))
            } else if card.name == "tourChange" {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .foregroundColor(Color("monJaune"))
                    .font(.system(size: 50))
                    .bold()
            } else if card.name == "tourPass" {
                Image(systemName: "nosign")
                    .rotationEffect(.degrees(120))
                    .foregroundColor(Color("monJaune"))
                    .font(.system(size: 50))
                    .bold()
                    
            }
            
                
            HStack {
                VStack {
                    Text("\(number) carte\(number > 1 ? "s" : " ")")
                        .foregroundColor(.red)
                        .padding(5)
                        .animation(.default, value: number)
                    Spacer()
                }
                Spacer()
            }
            .frame(width: 100, height: 150)
            HStack {
                VStack {
                    Spacer()
                    Button {
                        if number > 0 {
                            number -= 1
                        }
                        card.totalPoint -= card.points
                        
                        print(" \(card.totalPoint)")
                           print("number: \(number)")
                        
                        
                    }label: {
                        ZStack {
                            Circle()
                                .frame(width: 20, height: 20)
                            Image(systemName: "minus")
                                .foregroundColor(.white)
                        }
                    }
                        .foregroundColor(.red)
                        .padding(5)
                }
                Spacer()
            }
            .frame(width: 100, height: 150)
            
            HStack {
                Spacer()
               
                VStack {
                   Spacer()
                    Button {
                        number += 1
                        card.totalPoint += card.points

                    }label: {
                        ZStack {
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.green)
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(5)
                        
                }
                
            }
            .frame(width: 100, height: 150)
            
        }
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
