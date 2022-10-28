//
//  PodiumModalView.swift
//  UnoScore
//
//  Created by Romain Poyard on 26/10/2022.
//

import SwiftUI
import SPConfetti

struct PodiumModalView: View {
    @ObservedObject var viewModel: ViewModel
    @State var onAppearConffetti = false
    var body: some View {
        
        List {
            ForEach(viewModel.users) { user in
                let index = viewModel.users.firstIndex(of: user)
                if let index = index {
                    Section{
                        HStack {
                            
                            ZStack {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(Color("monJaune").opacity(1 - Double(index) / 3.0))
                                
                                
                                Text("\( index + 1)")
                                    .font(.custom("CabinCondensed-Bold", size: 30))
                                    .foregroundColor(Color("monRouge"))
                                    .font(.title)
                                    .padding(.bottom, -8.0)
                                    
                                    
                                
                                 
                            }
                           
                            Text(user.name)
                                .font(.custom("CabinCondensed-Bold", size: 25))
                            
                        }
                        .confetti(isPresented: $onAppearConffetti, animation: SPConfettiAnimation.fullWidthToDown, particles: [.circle], duration: 10)
                        
                    }
                    .onAppear {
                        onAppearConffetti = true
                    }
                    
                    
                }
            }
            
            
            
            Section {
                Button {
                    
                }label: {
                    HStack {
                        Spacer()
                        Text("Rejouer la partie")
                            .frame(width: 150)
                            .font(.custom("CabinCondensed-Bold", size: 20))
                        Spacer()
                    }
                }
                .buttonStyle(.borderless)
            }
            Section {
                Button{
                    
                }label: {
                    HStack{
                        Spacer()
                        Text("Nouvelle partie")
                            .frame(width: 150)
                            .font(.custom("CabinCondensed-Bold", size: 20))
                        Spacer()
                    }
                    
                }
                .buttonStyle(.borderless)

            }
                        
                
        }
        .navigationTitle("Classement")
        
    }
}

struct PodiumModalView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PodiumModalView(viewModel: ViewModel())
        }
    }
}
