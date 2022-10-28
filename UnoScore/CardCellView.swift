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
                
                
                
            
            if card.name.count <= 1 {
                Ellipse()
                    .frame(width: 75, height: 136)
                    .foregroundColor(Color("rougeUno"))
                    .rotationEffect(.degrees(38))
                    .overlay(content: {
                        Ellipse()
                            .strokeBorder(lineWidth: 4)
                            .frame(width: 75, height: 136)
                            .foregroundColor(.white)
                            
                            .rotationEffect(.degrees(38))
                            
                    })
                Text(card.name)
                    .shadow(color: .black ,radius: 0.1, x: 1, y: 1.5)
                    .font(.custom("CabinCondensed-Bold", size: 60))
                    
                    .foregroundColor(Color("monJaune"))
                   // .rotationEffect(.degrees(2))
            }else if card.name == "ChangeColor" {
                Image("changeColorImage")
                    
                    .resizable()
                    .rotationEffect(.degrees(7))
                    .frame(width: 94 , height: 120)
                    .overlay(content: {
                        Ellipse()
                            .strokeBorder(lineWidth: 4)
                            .frame(width: 75, height: 136)
                            .foregroundColor(.white)
                            
                            .rotationEffect(.degrees(38))
                            
                    })
                    
                    
            } else if card.name == "tourChange" {
                Ellipse()
                    .frame(width: 75, height: 136)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(38))
                    .overlay(content: {
                        Ellipse()
                            .strokeBorder(lineWidth: 4)
                            .frame(width: 75, height: 136)
                            .foregroundColor(.white)
                            
                            .rotationEffect(.degrees(38))
                            
                    })
                TourChangeCardView()
                    
                    
            } else if card.name == "tourPass" {
                Ellipse()
                    .frame(width: 75, height: 136)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(38))
                    .overlay(content: {
                        Ellipse()
                            .strokeBorder(lineWidth: 4)
                            .frame(width: 75, height: 136)
                            .foregroundColor(.white)
                            
                            .rotationEffect(.degrees(38))
                            
                    })
                Image(systemName: "nosign")
                    .shadow(color: .black ,radius: 0.1, x: -2, y: 1)
                    .rotationEffect(.degrees(100))
                    .foregroundColor(Color("monJaune"))
                    .font(.system(size: 55).weight(.bold))
                    
                    
                    
            } else if card.name == "+4" {
                Ellipse()
                    .frame(width: 75, height: 136)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(38))
                    .overlay(content: {
                        Ellipse()
                            .strokeBorder(lineWidth: 4)
                            .frame(width: 75, height: 136)
                            .foregroundColor(.white)
                            
                            .rotationEffect(.degrees(38))
                            
                    })
                PlusFourCardDraw()
                
                
            } else if card.name == "+2" {
                Ellipse()
                    .frame(width: 75, height: 136)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(38))
                    .overlay(content: {
                        Ellipse()
                            .strokeBorder(lineWidth: 4)
                            .frame(width: 75, height: 136)
                            .foregroundColor(.white)
                            
                            .rotationEffect(.degrees(38))
                            
                    })
                PlusTwoCardView()
            }
            
            
            if number > 0 {
                HStack {
                    VStack {
                        
                        Text("\(number) carte\(number > 1 ? "s" : " ")")
                            .foregroundColor(.red)
                            .padding(6)
                            .animation(.default, value: number)
                            .font(.custom("CabinCondensed-Bold", size: 17))
                        
                        Spacer()
                    }
                    .padding(.vertical, -5)
                    Spacer()
                }
                .frame(width: 100, height: 150)
            }
            HStack {
                VStack {
                    Spacer()
                    Button {
                        if number > 0 {
                            number -= 1
                            card.totalPoint -= card.points
                        }
                        
                        
                        print(" \(card.totalPoint)")
                           print("number: \(number)")
                        
                        
                    }label: {
                        ZStack {
                            Circle()
                                .frame(width: 21, height: 21)
                            Image(systemName: "minus")
                                .foregroundColor(.white)
                        }
                    }
                        .foregroundColor(.red)
                        .padding(-2.5)
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
                        print(" \(card.totalPoint)")
                           print("number: \(number)")

                    }label: {
                        ZStack {
                            Circle()
                                .frame(width: 21, height: 21)
                                .foregroundColor(.green)
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(-2.5)
                        
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
        CardCellView(card: Card.one, viewModel: ViewModel(), number: 0)
    }
}
