//
//  ScoreView.swift
//  UnoScore
//
//  Created by Romain Poyard on 16/08/2022.
//
//
//if viewModel.users.count < 1 {
//    presentationMode.wrappedValue.dismiss()
//}

import SwiftUI
import SPConfetti
import SwiftConfettiView

struct ScoreView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var viewModel: ViewModel
    @State var index = 0
    @State var score = 0
    
   
    @State var showingEndGameAlert = false
    @State var endGameIsPossible = false
    
  
    
    @State var isShowingModal: Bool = false
    @State var isDecreaseScore = false
    @Binding var showModalPodium: Bool
    var body: some View {
        List {
           
            if endGameIsPossible {
                Section {
                    
                    
                    Button {
                       // showModalPodium = true
                        showingEndGameAlert = true
                       
                    }label: {
                        HStack {
                            Spacer()
                            Text("Terminer la partie")
                            Spacer()
                        }
                    }
                    .listRowBackground(Color("monJaune"))
                    .font(.custom("CabinCondensed-Bold", size: 25))
                    
                    
                }
                
                .alert("\(viewModel.users.first?.name ?? "Erreur") gagne cette partie!", isPresented: $showingEndGameAlert) {
                    Button{
                        
                        showModalPodium = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            presentationMode.wrappedValue.dismiss()
                        }
                            
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
                    .confettiParticle(\.colors, [UIColor(Color("monVert")),
                                                 UIColor(Color("rougeUno")),
                                                 UIColor(Color("monJaune")),
                                                 UIColor(Color("monBleu"))])
                    
            }
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
                                withAnimation {
                                    endGameIsPossible = true
                                }
                            } else {
                                withAnimation {
                                    endGameIsPossible = false
                                }
                            }
                        }

                        if isDecreaseScore {
                            Button {
                                self.index = index
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    isShowingModal = true
                                }
                            }label: {
                                Image(systemName: "pencil.line")
                                Text("Enlever des points")
                            }
                            .buttonStyle(.borderless)
                            
                        }
                    }


                    
                    .sheet(isPresented: $isShowingModal) {
                        EditingModalView(viewModel: viewModel, userIndex: self.index, doneEditButton: $isDecreaseScore, isShowingModal: $isShowingModal)
                        
                    }
                    

                    
                    
                    
                }
                
                
                
            }
            

       
           
        }
        
        
        .navigationTitle("Tableau de score")
        
        .onAppear {
            isDecreaseScore = false
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    withAnimation {
                        isDecreaseScore.toggle()
                    }
                    
                    
                }label: {
                    
                    if isDecreaseScore == false {
                        HStack {
                            Text("Modifier score")
                            Image(systemName: "pencil.circle.fill")
                        }
                    } else {
                        HStack {
                            Text("Terminer")
                            Image(systemName: "checkmark.circle.fill")
                        }
                    }
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("Back")
                        .foregroundColor(Color("monVert"))
                        .padding(.leading, -20)
                    
                }
                
            }
        }
    }
}
    

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScoreView(viewModel: ViewModel(), showModalPodium: .constant(true))
        }
    }
}
