//
//  TestFontSwiftui.swift
//  UnoScore
//
//  Created by Romain Poyard on 29/09/2022.
//

import SwiftUI

struct TestFontSwiftui: View {
    let allFontNames = UIFont.familyNames
        .flatMap { UIFont.fontNames(forFamilyName: $0) }
    
    var body: some View {
        List(allFontNames, id: \.self) { name in
            VStack {
                Text("1  2  3  4  5  6  7  8  9")
                Text(name)
                    .font(Font.custom(name, size: 20))
            }
        }
    }
}

struct TestFontSwiftui_Previews: PreviewProvider {
    static var previews: some View {
        TestFontSwiftui()
    }
}
