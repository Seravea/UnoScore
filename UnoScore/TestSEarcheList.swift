//
//  TestSEarcheList.swift
//  UnoScore
//
//  Created by Romain Poyard on 02/11/2022.
//

import SwiftUI

struct TestSEarcheList: View {
    @State var search = ""
    var body: some View {
       
            
                VStack {
                  
                    List {
                        HStack {
                            TextEditor(text: $search)
                               
                            
                            Button {
                                
                            }label: {
                                Image(systemName: "arrow.up.circle")
                                    .font(.largeTitle)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                   
    //                List(1...10, id: \.self) { i in
    //                    ZStack {
    //                        TextEditor(text: $search)
    //                        Text(search).opacity(0).padding(.all, 8)
    //                    }
    //                }
                }
            
        
    }
}

struct TestSEarcheList_Previews: PreviewProvider {
    static var previews: some View {
        TestSEarcheList()
    }
}
