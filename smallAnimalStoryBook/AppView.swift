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
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
