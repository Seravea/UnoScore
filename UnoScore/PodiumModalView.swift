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
    @State var isShowingAlert = false
    @State var alertMessage: EndGame = .restartGame
    @Binding var isShowingPodiumView: Bool
    var body: some View {
        
        List {
            ForEach(viewModel.users) { user in
                let index = viewModel.users.firstIndex(of: user)
                if let index = index {
                    Section{
                        HStack {
                            
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color("monJaune").opacity(1 - Double(index) / 3.0))
                                
                                
                                Text("\( index + 1)")
                                    .font(.custom("CabinCondensed-Bold", size: 30))
                                    .foregroundColor(Color("monRouge"))
                                    .font(.title)
                                  //  .padding(.bottom, -8.0)
                                    
                                    
                                
                                 
                            }
                           
                            Text(user.name)
                                .font(.custom("CabinCondensed-Bold", size: 25))
                            Spacer()
                            Text("\(user.score) points")
                                .font(.custom("CabinCondensed-Bold", size: 25))
                        }
                        
                        .confetti(isPresented: $onAppearConffetti, animation: SPConfettiAnimation.fullWidthToDown, particles: [.circle], duration: 10)
                        .confettiParticle(\.colors, [UIColor(Color("monVert")), UIColor(Color("rougeUno")), UIColor(Color("monJaune")), UIColor(Color("monBleu"))])
                        
                    }
                    .onAppear {
                        onAppearConffetti = true
                    }
                    
                    
                }
            }
            
            
            
            Section {
                Button {
                    alertMessage = .restartGame
                    isShowingAlert = true
                    SPConfetti.stopAnimating()
                    
                }label: {
                    ButtonUnoStyle(buttonTitle: "Rejouer la partie", shadowColor: "darkYellow")
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("monJaune"))
                .frame(maxWidth: 350)
                .listRowBackground(Color.clear)
                .shadow(radius: 1)
            }
            Section {
                Button{
                    alertMessage = .newGame
                    isShowingAlert = true
                    SPConfetti.stopAnimating()
                }label: {
//                    HStack{
//                        Spacer()
//                        Text("Nouvelle partie")
//                            .frame(width: 150)
//                            .font(.custom("CabinCondensed-Bold", size: 20))
//                        Spacer()
//                    }
                    ButtonUnoStyle(buttonTitle: "Nouvelle partie", shadowColor: "darkYellow")
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("monJaune"))
                .frame(maxWidth: 350)
                .listRowBackground(Color.clear)
                .shadow(radius: 1)

            }
            .alert("Fin de partie", isPresented: $isShowingAlert) {
                Button(role: .cancel) {
                }label: {
                    Text("Non")
                }
                Button {
                    if alertMessage == .restartGame {
                        for index in 0...viewModel.users.count - 1 {
                            viewModel.users[index].score = 0
                            isShowingPodiumView = false
                        }
                    } else if alertMessage == .newGame {
                        viewModel.users.removeAll()
                        isShowingPodiumView = false
                    }
                    
                }label: {
                   Text("Oui")
                }
            } message: {
                Text(alertMessage.rawValue)
            }

            }
                        
        .navigationTitle("Classement")
        }
        
        
        
    }


struct PodiumModalView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PodiumModalView(viewModel: ViewModel(), isShowingPodiumView: .constant(false))
        }
    }
}
