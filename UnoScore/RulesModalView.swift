//
//  RulesModalView.swift
//  UnoScore
//
//  Created by Romain Poyard on 27/10/2022.
//

import SwiftUI

struct RulesModalView: View {
    
    @Binding var isModalOn: Bool
    var body: some View {
        NavigationView {
            List {
                Section {
                    Text("Le calcul des points peut se faire en calculant le nombre de points que chaque joueur a en main à la fin de chaque manche.\nChaque joueur a ainsi un score personnel qu’il incrémente à chaque manche. Avec cette formule, dès qu’un joueur fait ou dépasse 500 points, il arrête la partie.\nLe joueur qui a le moins de points devient le vainqueur.")
                        .font(.custom("CabinCondensed-Bold", size: 20))
                }header: {
                    Text("Comptage des points")
                        .font(.custom("CabinCondensed-Bold", size: 20))
                }
                Section {
                    DisclosureGroup("Le jeu UNO") {
                       Text("À chaque manche, les participants ont pour objectif de se débarrasser de leurs cartes avant les autres.\nLe premier qui y arrive arrête la partie.\nIl marquera des points pour toutes les cartes que ses adversaires ont encore en main à la fin de la partie.\nDans UNO, les points s’accumulent d’une manche à une autre, et le premier joueur qui atteint la barre des 500 points remporte le jeu.")
                            .font(.custom("CabinCondensed-Bold", size: 20))
                    }
                }header: {
                    Text("Objectif")
                        .font(.custom("CabinCondensed-Bold", size: 20))
                }
                
                
                Section {
                    DisclosureGroup("Étape 1") {
                       Text("Chaque participant sélectionne une carte. Celui qui obtient la carte avec le chiffre le plus élevé devient le donneur (Les cartes qui ont des symboles représentent le chiffre 0)")
                            .font(.custom("CabinCondensed-Bold", size: 20))
                    }
                    DisclosureGroup("Étape 2") {
                       Text("Après avoir mélangé les cartes dans ses mains, le donneur en distribue 7 à chaque participant.")
                            .font(.custom("CabinCondensed-Bold", size: 20))
                    }
                    DisclosureGroup("Étape 3") {
                       Text("Les cartes qui restent après la distribution forment la pioche : elles sont disposées en tas et ont la face cachée")
                            .font(.custom("CabinCondensed-Bold", size: 20))
                    }
                    DisclosureGroup("Étape 4") {
                       Text("La première carte de la Pioche est retournée afin de représenter le talon.")
                            .font(.custom("CabinCondensed-Bold", size: 20))
                    }
                    
                }header: {
                    Text("Préparation")
                        .font(.custom("CabinCondensed-Bold", size: 20))
                }
                
                Section {
                    DisclosureGroup("Lancement") {
                        Text("Après la distribution des cartes UNO, le joueur à la gauche du donneur commence la partie. Il recouvre la carte visible du talon avec une carte de la même couleur. Ou alors il choisit une carte ayant le même numéro ou le même symbole.")
                    }
                    DisclosureGroup("Exemple") {
                        Text("Par exemple, si la carte visible est un 9 vert, le joueur pose une carte verte ou un 9 de n’importe quelle couleur.\nIl peut également mettre une carte blanche, «Joker», «+4» etc.. s’il en dispose.\nDans le cas où le joueur ne dispose d’aucune carte qui correspond à celle du talon, il peut en prendre une dans la pioche")
                    }
                    
                    DisclosureGroup("Pioche") {
                        Text("Si après le choix de la carte dans la pioche, le joueur se rend compte qu’elle peut être jouée immédiatement, il s’en sert. Dans le cas inverse, si la carte ne peut être utilisée immédiatement, il passe son tour, tout en conservant cette carte comme carte supplémentaire.\nUn joueur peut volontairement décider de ne pas jouer une carte.\nDans ce cas, il en sélectionne une dans la pioche.\nSi elle peut être utilisée immédiatement, il s’en sert.\nCependant, il doit veiller à ne pas utiliser une carte qu’il avait déjà en main.")
                    }
                    
                }header: {
                    Text("Règlement")
                        .font(.custom("CabinCondensed-Bold", size: 20))
                }
                Section {
                    if let url = URL(string: "https://jeu-uno.info/la-regle-du-jeu/") {
                        Link("Plus de détails sur les règles UNO", destination: url)
                    }
                   
                }
                
                
            }
            .navigationTitle("Règlement")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isModalOn = false
                    }label: {
                        Text("Quitter")
                    }
                }
        }
        }
        .accentColor(Color("monVert"))
    }
}

struct RulesModalView_Previews: PreviewProvider {
    static var previews: some View {
       
            RulesModalView(isModalOn: .constant(true))
        
        
    }
}
