//
//  ModifyScoreView.swift
//  UnoScore
//
//  Created by Romain Poyard on 17/08/2022.
//

import SwiftUI

struct ModifyScoreView: View {
    @State var backButtonAnimation = false
    @ObservedObject var viewModel: ViewModel
    @State var score: Int = 0
    var userIndex: Int
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible())
        ]
    
    
    @Environment(\.presentationMode) private var presentationMode
    
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    @State var editValue: Int?
    
    
    var body: some View {
        VStack {
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.cards) { card in
                        
                            
                                CardCellView(card: card, viewModel: viewModel)
                            
                                    
                                    
                            
                        
                    }
                }
            }
            .onAppear{
                
               
                viewModel.cardSetToZero(cards: viewModel.cards)
                score = 0
                
            }
            
        }
        .navigationTitle(viewModel.users[userIndex].name)
        .navigationBarBackButtonHidden(true)
        .onDisappear{
                for card in viewModel.cards {
                   score += card.totalPoint
                    
                }
            viewModel.users[userIndex].score += score
            viewModel.sortedArrayByScore(users: viewModel.users)
            
        }
        .onAppear {
            backButtonAnimation.toggle()
        }
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    
                        HStack(spacing: 5) {
                            Image(systemName: "chevron.left")
                                .font(.body.bold())
                            withAnimation {
                            Text("Ajouter les points")
                                .animation(.easeIn(duration: 2), value: backButtonAnimation)
                            
                        }
                    }
                        
                        .padding(-8)
                    
                    
                }
                .frame(width: 155, height: 40)
                

                
            }
        }
        
    }
}

struct ModifyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ModifyScoreView(viewModel: ViewModel(), userIndex: 0, editValue: nil)
        }
    }
}
