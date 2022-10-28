//
//  WebUnoRulesView.swift
//  UnoScore
//
//  Created by Romain Poyard on 27/10/2022.
//



//struct WebUnoRulesView: View {
import SwiftUI
import WebKit
 
struct WebUnoRulesView: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

//struct WebUnoRulesView_Previews: PreviewProvider {
//    static var previews: some View {
//        WebUnoRulesView(url: URL(string: ""))
//    }
//}
