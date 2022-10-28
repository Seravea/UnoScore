//
//  StartGameView.swift
//  UnoScore
//
//  Created by Romain Poyard on 16/08/2022.
//

import SwiftUI

struct StartGameView: View {
    @ObservedObject var viewModel = ViewModel()
    
    @State var isShowingRulesSheet = false
    @State var isShowingSheet = false
    @State var showingGame = false
    @State var name = ""
    @FocusState private var nameIsFocused: Bool
    
    var nameIsnNotEmpty: Bool {
        if name.isEmpty {
            
            return false
        }else {
            return true
        }
    }
    var nameIsCorrect: Bool {
        if name.count >= 2 {
            return true
        }else {
            return false
        }
    }
    
    @State var isShowingAlert = false
    
    @AppStorage("USERS") var savedUsers: Data = Data()
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        withAnimation {
                            TextField("Pseudo", text: $name)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                                .focused($nameIsFocused)
                        }
                        .transition(.move(edge: .leading))
                        .animation(.easeIn)
                        
                        
                        
                            
                                Button {
                                    withAnimation {
                                        viewModel.users.append(User(name: name))
                                        name = ""
                                    }
                                    
                                }label: {
                                    Image(systemName: "arrow.up.circle")
                                        .font(.largeTitle)
                                }
                                .buttonStyle(.borderless)
                                .disabled(!nameIsnNotEmpty)
                                
                        
                        
                    }
                    ForEach(viewModel.users) { user in
                        HStack {
                            
                            Text(user.name)
                                .font(.custom("CabinCondensed-Bold", size: 20))
                        }
                    } .onDelete(perform: delete)
                    
                    
                }header: {
                        Text("Ajouter des joueurs")
                        .font(.custom("CabinCondensed-Bold", size: 15))
                        
                }
                if viewModel.users.count >= 2 {
                    withAnimation {
                        NavigationLink {
                            ScoreView(viewModel: viewModel)
                        }label: {
                            Text("Lancer la partie")
                                .bold()
                                .foregroundColor(Color("monVert"))
                                .font(.custom("CabinCondensed-Bold", size: 25, relativeTo: .body))
                                
                                //.font(.system(size: 25))
                                
                             
                        }
                        .listRowBackground(Color("monJaune"))
                        .animation(.default)
                    }
                    
                    
                
                } else {
                    withAnimation {
                        Text("* Minimum 2 joueurs")
                            .animation(.default)
                            .font(.custom("CabinCondensed-Bold", size: 17))
                            .listRowBackground(Color("rougeUno"))
                    }
                    
                }
                Section {
                    if viewModel.users.isEmpty == false {
                        withAnimation {
                            Button {
                                isShowingAlert.toggle()
                                
                            }label: {
                                HStack {
                                    Spacer()
                                    Text("Supprimer la partie")
                                        .animation(.default)
                                    .font(.custom("CabinCondensed-Bold", size: 20))
                                    .foregroundColor(Color("monJaune"))
                                    
                                    Spacer()
                                }
                            }
                            .listRowBackground(Color("rougeUno"))
                        }

                        
                        
                    }
                }
                
              
                    Section {
                        HStack {
                            Spacer()
                            Button{
                                isShowingRulesSheet = true
                            }label: {
                                HStack{
                                    Image(systemName: "book.circle")
                                        .accentColor(Color("monVert"))
                                        .font(.title3)
                                    Text("Voir les règles du jeux")
                                        .foregroundColor(Color("monVert"))
                                        .font(.custom("CabinCondensed-Bold", size: 18))
                                }
                        }
                            Spacer()
                        }
                    }
                    .listRowBackground(Color("monJaune"))
                    .sheet(isPresented: $isShowingRulesSheet) {
                        RulesModalView(isModalOn: $isShowingRulesSheet)
                    }
                
                
            }
            .alert("Voulez-vous supprimer la partie en cours", isPresented: $isShowingAlert, actions: {
                Button("Non", role: .cancel) { }
                Button("Oui", role: .destructive) {
                    withAnimation {
                        viewModel.users.removeAll()
                    }
                }
                
            })
            .navigationTitle("Table de jeu")
            .toolbar {
                ToolbarItem(id: "Edit") {
                    EditButton()
                        .disabled(viewModel.users.isEmpty)
                }
//                ToolbarItem(placement: .keyboard) {
//
//
//                        Button{
//                            nameIsFocused = false
//                        }label: {
//                            Text("Valider")
//                        }
//                    .accentColor(Color("monVert"))
//
//
//                }
            }
            
        }
        
    }
    func delete(at offsets: IndexSet) {
        viewModel.users.remove(atOffsets: offsets)
        }
}

struct StartGameView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView()
    }
}
