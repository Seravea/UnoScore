//
//  StartGameView.swift
//  UnoScore
//
//  Created by Romain Poyard on 16/08/2022.
//

import SwiftUI

struct StartGameView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var isShowingSheet = false
    @State var showingGame = false
    @State var name = ""
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
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        withAnimation {
                            TextField("Pseudo", text: $name)
                                .textFieldStyle(.roundedBorder)
                                .padding()
                        }
                        .transition(.move(edge: .leading))
                        .animation(.easeIn)
                        
                        
                        if nameIsnNotEmpty {
                            
                                Button {
                                    withAnimation {
                                        viewModel.users.append(User(name: name))
                                        name = ""
                                    }
                                    
                                }label: {
                                    Image(systemName: "plus.circle")
                                        .font(.largeTitle)
                                }
                                
                                .transition(.move(edge: .trailing))
                                .animation(.easeIn)
                            
                        }
                        
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
                                .foregroundColor(.white)
                                .font(.custom("CabinCondensed-Bold", size: 25))
                                .bold()
                             
                        }
                        .listRowBackground(Color("monVert"))
                        .animation(.default)
                    }
                    
                    
                
                } else {
                    withAnimation {
                        Text("* Minimum 2 joueurs")
                            .animation(.default)
                            .font(.custom("CabinCondensed-Bold", size: 17))
                    }
                    
                }
                    
                if (viewModel.users.count >= 2) && (viewModel.users[0].score > 0 || viewModel.users[1].score > 0) {
                    withAnimation {
                        Button {
                            isShowingAlert.toggle()
                            
                        }label: {
                            Text("Nouvelle partie")
                                .animation(.default)
                                .font(.custom("CabinCondensed-Bold", size: 20))
                        }
                    }

                    
                    
                }
                
            }
            .alert("Voulez-vous supprimer cette partie en cours", isPresented: $isShowingAlert, actions: {
                Button("Non") { }
                Button("Oui") {
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
