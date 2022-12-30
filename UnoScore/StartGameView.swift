//
//  StartGameView.swift
//  UnoScore
//
//  Created by Romain Poyard on 16/08/2022.
//

import SwiftUI
import SPConfetti

struct StartGameView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var showingModalPodium = false
    

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
    @State var isNavigateGame = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
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
                        
                        HStack {
                            Spacer()
                            Button {
                                    isShowingAlert.toggle()
                                    
                                }label: {
                                    HStack {
                                        
                                        Text("Supprimer la partie")
                                            .animation(.default)
                                        .font(.custom("CabinCondensed-Bold", size: 20))
                                        .foregroundColor(viewModel.users.count >= 2 ? Color("monJaune") : .black.opacity(0.6) )
                                        
                                        
                                    }
                                    .frame(width: 250)
                                    
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(Color("rougeUno"))
                                .disabled(viewModel.users.count >= 2 ? false : true )
                            
                            Spacer()
                        }
                        .listRowBackground(Color.clear)
                            
                        

                    }header: {
                            Text("Ajouter des joueurs")
                            .font(.custom("CabinCondensed-Bold", size: 15))
                            
                    }
                    
                    if viewModel.users.count >= 2 {
                        withAnimation {
                            Button {
                                isNavigateGame = true
                            }label: {
                                ButtonUnoStyle(buttonTitle: "Lancer la partie", shadowColor: "darkYellow")
                                
                                    
                                 
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(Color("monJaune"))
                            .listRowBackground(Color.clear)
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
                    
                    
                    
                        
                        
                        
                    
                    
                }
                
                .listStyle(.insetGrouped)
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
                    ToolbarItem(id: "Éditer", placement: .navigationBarTrailing) {
                        EditButton()
                            .disabled(viewModel.users.isEmpty)
                    }
            }
                
                VStack {
                    NavigationLink(destination: ScoreView(viewModel: viewModel, showModalPodium: $showingModalPodium), isActive: $isNavigateGame) {
                        EmptyView()
                    }
                }
            }
            .fullScreenCover(isPresented: $showingModalPodium, content: {
                PodiumModalView(viewModel: viewModel, isShowingPodiumView: $showingModalPodium)
            })
            
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

struct ButtonUnoStyle: View {
    var buttonTitle: String
    var shadowColor: String
    var body: some View {
        ZStack {
            Text(buttonTitle)
                .bold()
                .font(.system(size: 28))
                .foregroundColor(Color(shadowColor))
                .shadow(radius: 1)
                .frame(maxWidth: 400, maxHeight: 30)
            
            Text(buttonTitle)
                .bold()
                .font(.title)
                .foregroundColor(.white)
            //.shadow(radius: 1)
            //.foregroundColor(Color("monVert"))
            //                                    .font(.custom("CabinCondensed-Bold", size: 25, relativeTo: .body))
                .frame(maxWidth: 400, maxHeight: 30)
            
            
        }
    }
}
