//
//  ScoreView.swift
//  UnoScore
//
//  Created by Romain Poyard on 16/08/2022.
//

import SwiftUI
import SPConfetti
import SwiftConfettiView

struct ScoreView: View {
    @ObservedObject var viewModel: ViewModel
    @State var isShowingSheetRules = false
    @State var index = 0
    @State var score = 0
    
    @AppStorage("USERS_KEY") var savedUsers = "[0, 1]"
   
    @State var showingEndGameAlert = false
    @State var endGameIsPossible = false
    
  
    
    @State var isShowingModal: Bool = false
    @State var isDecreaseScore = false
    @State var showModalPodium = false
    var body: some View {
        List {
           // let users = viewModel.users.sorted(by: { $0.score < $1.score})
            
            ForEach(viewModel.users) { user in
                let index = viewModel.users.firstIndex(of: user)
                if let index = index {
                    
                    
                    Section {
                        
                        NavigationLink {
                            ModifyScoreView(viewModel: viewModel, userIndex: index)
                        } label: {
                            HStack {
                                if viewModel.users.last!.score > 0 {
                                    ZStack {
                                        Image(systemName: "circle.fill")
                                            .font(.largeTitle)
                                            .foregroundColor(Color("monJaune"))
                                        
                                        Text("\( index + 1)")
                                            .foregroundColor(Color("monRouge"))
                                            .font(.title)
                                        
                                    }
                                } else {
                                    ZStack {
                                        Image(systemName: "circle.fill")
                                            .font(.largeTitle)
                                            .foregroundColor(Color.clear)
                                        
                                        Text("\( index + 1)")
                                            .foregroundColor(Color.clear)
                                            .font(.title)
                                        
                                    }
                                }
                               
                                Text(user.name)
                                
                                Spacer()
                                
                                Text("\(user.score) Points")
                                
                            }
                            .font(.custom("CabinCondensed-Bold", size: 25))
                            
                        }
                        .onChange(of: viewModel.users) { newValue in
                            if viewModel.users.last!.score >= 500 {
                                endGameIsPossible = true
                            }
                        }
                        if isDecreaseScore {
                            Button {
                                isShowingModal = true
                            }label: {
                                
                                Text("Enlever des points")
                            }
                            .buttonStyle(.borderless)
                            
                        }
                    }


                    
                    .sheet(isPresented: $isShowingModal) {
                        EditingModalView(viewModel: viewModel, userIndex: index, doneEditButton: $isDecreaseScore, isShowingModal: $isShowingModal)
                        
                    }
                    

                    
                    
                    
                }
                
                
                
            }
            if endGameIsPossible {
                Section {
                    
                    
                    Button {
                        showingEndGameAlert = true
                    }label: {
                        HStack {
                            Spacer()
                            Text("Finir la partie")
                            Spacer()
                        }
                    }
                    .listRowBackground(Color("monJaune"))
                    .font(.custom("CabinCondensed-Bold", size: 25))
                    
                }
                .alert("\(viewModel.users.first!.name) gagne cette partie!", isPresented: $showingEndGameAlert) {
                    Button{
                            showModalPodium = true
                        }label: {
                            Text("Oui")
                        }
                    Button(role: .cancel) { }label: {
                        Text("Non")
                    }
                    } message: {
                        Text("Voulez-vous voir le classement ?")
                            .font(.custom("CabinCondensed-Bold", size: 20))
                    }
                    .confetti(isPresented: $showingEndGameAlert, animation: SPConfettiAnimation.fullWidthToDown, particles: [.circle], duration: 10)
                    .fullScreenCover(isPresented: $showModalPodium, content: {
                        PodiumModalView(viewModel: viewModel)
                    })
                    
                    

            }
            Section {
                Button{
                    isShowingSheetRules = true
                }label:{
                    Label {
                        Text("Règles du jeux")
                    } icon: {
                        Spacer()
                        Image(systemName: "book.circle")
                            .font(.title)
                        
                    }

                  
                }
                        .foregroundColor(Color("monVert"))
                        .font(.custom("CabinCondensed-Bold", size: 20))
                        
                
               
            }
            .listRowBackground(Color("monJaune"))
            .sheet(isPresented: $isShowingSheetRules) {
                RulesModalView(isModalOn: $isShowingSheetRules)
            }
        }
        .navigationTitle("Tableau de score")
        .onAppear {
            isDecreaseScore = false
            
            for i in viewModel.users {
                print(i.name)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    withAnimation {
                        isDecreaseScore.toggle()
                    }
                    
                    
                }label: {
                    
                    if isDecreaseScore == false {
                        Text("Modifier score")
                    } else {
                        Text("Done")
                    }
                }
                
                
                
                
                
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScoreView(viewModel: ViewModel())
        }
    }
}
