//
//  EditingModalView.swift
//  UnoScore
//
//  Created by Romain Poyard on 22/09/2022.
//

import SwiftUI

struct EditingModalView: View {
    var viewModel: ViewModel
    var userIndex: Int
    
    
    
    @State var editValue: Int = 0
    
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    @State var isShowingAlert = false
    @Binding var isShowingModal: Bool
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Text(viewModel.users[userIndex].name)
                        .font(.largeTitle)
                        .bold()
                    .padding()
                    Spacer()
                }
                
                Spacer()
                
                if viewModel.removeScoreIsOK(editValue: editValue, userIndex: userIndex) {
                    VStack {
                        Text("Vous ne pouvez pas enlever \(editValue) points")
                        Text("\(viewModel.users[userIndex].name) n'a que \(viewModel.users[userIndex].score) points")
                    }
                    .padding()
                    .font(.custom("CabinCondensed-Bold", size: 20))
                    
                    
                } else {
                    Text("      Easter          ")
                        .foregroundColor(.white)
                    Text("       Egg        ")
                        .foregroundColor(.white)
                }
                HStack {
                    TextField("Points à enlever", value: $editValue, formatter: formatter)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        isShowingAlert.toggle()
                    
                    } label: {
                        Text("Edit")
                            .font(.custom("CabinCondensed-Bold", size: 20))
                    }
                    .disabled(viewModel.removeScoreIsOK(editValue: editValue, userIndex: userIndex))
                    .buttonStyle(.bordered)
                   
                    
                    .alert("Voulez- vous enlever \(editValue) points à \(viewModel.users[userIndex].name)", isPresented: $isShowingAlert) {
                                Button("Non !!", role: .cancel) { }
                        Button {
                            viewModel.users[userIndex].score -= editValue
                            isShowingModal.toggle()
                        }label: {
                            Text("Oui !!")
                        }
                        
                        
                            }
                }
                .padding()
                
                Spacer()
                
            }
            .navigationTitle("Retirer des points à")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingModal = false
                    }label: {
                        Text("Annuler")
                            .font(.custom("CabinCondensed-Bold", size: 18))
                    }                }
            }
        }
        .accentColor(Color("monVert"))
        
    }
}

struct EditingModalView_Previews: PreviewProvider {
    static var previews: some View {
       
            EditingModalView(viewModel: ViewModel(), userIndex: 0, isShowingModal: .constant(true))
        
        
    }
}
