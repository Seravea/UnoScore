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
    var body: some View {
        List {
            ForEach(viewModel.users.sorted(by: { $0.score > $1.score})) { user in
                let index = viewModel.users.firstIndex(of: user)
                if let index = index {
                    Section {
                        NavigationLink {
                            ModifyScoreView(viewModel: viewModel, userIndex: index)
                        } label: {
                            HStack {
                                Text(user.name)
                                Text("\(user.score) Points")
                                
                            }
                            
                        }
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
