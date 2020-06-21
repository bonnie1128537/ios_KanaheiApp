//
//  WebView.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/20.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI
import WebKit
struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let urlString: String
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(urlString: "https://www.youtube.com/watch?v=1ioJ4J84q-o")
    }
}
