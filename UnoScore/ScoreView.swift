//
//  ScoreView.swift
//  UnoScore
//
//  Created by Romain Poyard on 16/08/2022.
//

import SwiftUI

struct ScoreView: View {
    @ObservedObject var viewModel: ViewModel
    
    @State var index = 0
    @State var score = 0
    @State var showingEndGameAlert = false
    
    var body: some View {
        List {
            let users = viewModel.users.sorted(by: { $0.score > $1.score})
            
            ForEach(users) { user in
                let index = viewModel.users.firstIndex(of: user)
                if let index = index {
                    Section {
                        NavigationLink {
                            ModifyScoreView(viewModel: viewModel, userIndex: index, endGameAlert: $showingEndGameAlert)
                        } label: {
                            HStack {
                                Text(user.name)
                                    
                                Spacer()
                                Text("\(user.score) Points")
                                
                            }
                            .font(.custom("CabinCondensed-Bold", size: 25))
                            
                        }
                        
                    }
                    
                    .alert("\(users.last!.name) gagne cette partie!", isPresented: $showingEndGameAlert) {
                        
                    } message: {
                        Text("\(users.first!.name) à perdu")
                            .font(.custom("CabinCondensed-Bold", size: 20))
                    }

                

                }
                    
                
            }
            
        }
        .navigationTitle("Tableau de score")
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScoreView(viewModel: ViewModel())
        }
    }
}
