//
//  ContentView.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/4/13.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotateDegree: Double = 0
    @State private var show = false
    
    var body: some View {
        NavigationView {
            ZStack {
            Image("index")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                VStack {
            Text("卡娜赫拉的小動物").font(Font.custom("jf-openhuninn-1.0", size: 35))
                    
                //Text("in").font(Font.custom("jf-openhuninn-1.0", size: 29))
                        
                /*NavigationLink(destination: YuruttoTownIntroView()) {
                        Text("愜意小鎮").font(Font.custom("jf-openhuninn-1.0", size: 29))
                    }*/
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
