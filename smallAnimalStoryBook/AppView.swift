//
//  AppView.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/4/13.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("首頁")
            }
            CharacterList()
                .tabItem{
                    Image(systemName: "person.2.fill")
                    Text("角色")
            }
            EventList()
                .tabItem{
                    Image(systemName: "calendar.badge.plus")
                    Text("展覽")
            }
            KanaheiView(BandName: Band(name:"カナヘイ", imageName: "カナヘイ"))
                .tabItem{
                    Image(systemName: "tv.music.note.fill")
                    Text("相關影片")
            }
            
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color(hue: 0.975, saturation: 0.395, brightness: 0.958))
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
