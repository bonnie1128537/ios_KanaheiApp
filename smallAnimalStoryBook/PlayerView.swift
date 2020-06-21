//
//  PlayerView.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/22.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI
import SafariServices

struct PlayerView: View {
    @State var link: URL
    
    var body: some View {
        SafariView(url:self.link)
    }

}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(link: URL(string:"https://www.youtube.com/watch?v=VpwAq7hiij0")!)
    }
}
