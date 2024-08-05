//
//  WebView.swift
//  ADDemo
//
//  Created by Sergio Ramirez on 4/08/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    init(_ url: URL) {
        self.url = url
    }
    
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

fileprivate struct WebViewPreview: View {
    var body: some View {
        WebView(URL(string: "https://www.google.com/")!)
    }
}

#Preview {
    WebViewPreview()
}
