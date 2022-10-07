//
//  ModifyScoreView.swift
//  UnoScore
//
//  Created by Romain Poyard on 17/08/2022.
//

import SwiftUI

struct ModifyScoreView: View {
    
    @ObservedObject var viewModel: ViewModel
    @State var score: Int = 0
    var userIndex: Int?
    let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
        ]
    @Binding var endGameAlert: Bool
    
    @Environment(\.presentationMode) private var presentationMode
    
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    @State var editValue: Int?
    @State var isShowingModal: Bool = false
    
    var body: some View {
        VStack {
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.cards) { card in
                        
                            
                                CardCellView(card: card, viewModel: viewModel)
                                    .onAppear{
                                        card.setToZero(card: card)
                                    }
                            
                        
                    }
                }
            }
            .sheet(isPresented: $isShowingModal) {
                EditingModalView(viewModel: viewModel, userIndex: userIndex!, isShowingModal: $isShowingModal)
            }

            
            
            
        }
        .navigationTitle(viewModel.users[userIndex!].name)
        
        .onDisappear{
                for card in viewModel.cards {
                   score += card.totalPoint
                }
            
            viewModel.users[userIndex!].score += score
            if viewModel.users[userIndex!].score >= 500 {
                endGameAlert = true
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    isShowingModal.toggle()
                } label: {
                    Text("Enlever des points")
                }
                .disabled(viewModel.users[userIndex!].score == 0)

                
            }
        }
        
    }
}

struct ModifyScoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ModifyScoreView(viewModel: ViewModel(), userIndex: 0, endGameAlert: .constant(false), editValue: nil)
        }
    }
}
