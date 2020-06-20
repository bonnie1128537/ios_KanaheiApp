//
//  ContentView.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/4/13.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI
import SafariServices
struct ContentView: View {
    
    @State private var rotateDegree: Double = 0
    @State private var show = false
    @State var showSafari = false
    @State var showWebview = false
    @State var urlString = "http://www.kanahei.com/"
    
    var body: some View {
        NavigationView {
            ZStack {
            Image("index")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                VStack {
                     Button(action: {
                            self.urlString = "http://www.kanahei.com/"
                            self.showSafari = true
                     }){
                        Text("卡娜赫拉的小動物").font(Font.custom("jf-openhuninn-1.0", size: 35))
                    }.sheet(isPresented: $showSafari) {
                        SafariView(url:URL(string: self.urlString)!)
                    }
                  Text("in").font(Font.custom("jf-openhuninn-1.0", size: 29))
                  Button(action: {
                    self.showWebview = !self.showWebview
                   }){
                    Text("愜意小鎮").font(Font.custom("jf-openhuninn-1.0", size: 29))
                  }
                    HStack {
                        Button(action: {
                            self.rotateDegree = 360
                        }){
                            Image("animate")
                            .rotationEffect(.degrees(rotateDegree))
                            .animation(
                              Animation.linear(duration: 5)
                                .repeatForever(autoreverses: false)
                            )
                        }.buttonStyle(PlainButtonStyle())
                        VStack {
                            if show {
                                Image("animate2")
                                    .transition(.scale(scale: 0.65))
                            }
                        }
                        .animation(.easeInOut(duration: 5))
                        .onAppear{
                            self.show = true
                        }
                        
                    }
                    if (self.showWebview == true){
                        WebView(urlString: "https://www.youtube.com/watch?v=1ioJ4J84q-o").frame(width: 400, height: 400)
                        //.clipShape(Circle())
                    }
                    Spacer()
                }
            }
        }.navigationBarTitle("展覽介紹")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}
