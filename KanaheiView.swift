//
//  KanaheiView.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/21.
//  Copyright © 2020 bc. All rights reserved.
//https://www.googleapis.com/customsearch/v1?cx=011026931733961081769:-vznxd-w4m8&key=AIzaSyAuKqowkIyBSROKCL3pbWyBfZ4Up2AWcIk&q=kanahei

import SwiftUI

struct KanaheiView: View {
    @State private var items = [Item]()
    @State private var showPlayerView = false
    @State private var nowIndex = 0
    var BandName: Band
    

    func GetSearch(){
        
        let urlStr = "https://www.googleapis.com/customsearch/v1?cx=011026931733961081769:-vznxd-w4m8&key=AIzaSyAuKqowkIyBSROKCL3pbWyBfZ4Up2AWcIk&q=カナヘイ&siteSearch=youtube.com"
        let newUrl = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: newUrl) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
                if let data = data {
                    do{
                        let searchResults = try JSONDecoder().decode(SearchObject.self, from: data)
                        self.items = searchResults.items
                    }
                    catch{
                        print(error)
                    }
                }
            }.resume()
            
        }
    }
    var body: some View {
        List(items.indices, id: \.self) { (index)  in
             SearchRow(item: self.items[index])
                 .onTapGesture {
                    self.showPlayerView = true
                    self.nowIndex = index
                 }
             }.sheet(isPresented: self.$showPlayerView) {
                 PlayerView(link: self.items[self.nowIndex].link)
         }
         .onAppear {
             if self.items.count == 0 {
                 self.GetSearch()
             }
         }
    }
}

struct KanaheiView_Previews: PreviewProvider {
    static var previews: some View {
        KanaheiView(BandName: Band(name:"カナヘイ", imageName: "カナヘイ"))
    }
}
