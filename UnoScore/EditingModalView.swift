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
        
        VStack {
            Text(viewModel.users[userIndex].name)
                .font(.largeTitle)
                .bold()
                .padding()
            
            Spacer()
            
            if viewModel.removeScoreIsOK(editValue: editValue, userIndex: userIndex) {
                VStack {
                    Text("Vous ne pouvez pas enlever \(editValue) points")
                    Text("\(viewModel.users[userIndex].name) n'a que \(viewModel.users[userIndex].score) points")
                }
                .padding()
                
                
            }
            HStack {
                TextField("Points à enlever", value: $editValue, formatter: formatter)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    isShowingAlert.toggle()
                
                } label: {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                }
                .disabled(viewModel.removeScoreIsOK(editValue: editValue, userIndex: userIndex))
               
                
                .alert("Voulez- vous enlever \(editValue) points à \(viewModel.users[userIndex].name)", isPresented: $isShowingAlert) {
                            Button("Non !!", role: .cancel) { }
                    Button {
                        viewModel.users[0].score -= editValue
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
        
    }
}

struct EditingModalView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EditingModalView(viewModel: ViewModel(), userIndex: 0, isShowingModal: .constant(true))
        }
        
    }
}
