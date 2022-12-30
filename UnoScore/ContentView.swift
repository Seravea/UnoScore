//
//  ContentView.swift
//  UnoScore
//
//  Created by Romain Poyard on 16/08/2022.
//

import SwiftUI
import SPConfetti

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("monGris"))
        
    }
    
    var body: some View {
        
        TabView {
            StartGameView()
                .tabItem {
                    Label {
                        Text("Score")
                    } icon: {
                        Image(systemName: "menucard")
                    }

                }
            RulesModalView()
                .tabItem {
                    Label("Règles", systemImage: "book")
                }
            
            
        }
       
        .accentColor(Color("monVert"))
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
