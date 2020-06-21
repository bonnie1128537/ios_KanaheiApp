//
//  NetworkImage.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/21.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct NetworkImage: View  {
    var url: URL
    @State private var image = Image(systemName: "photo")
    @State private var downloadImageOk = false

    func downLoad() {
        if let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
            self.image = Image(uiImage: uiImage)
            self.downloadImageOk = true
        }
    }
   var body: some View {
        image
            .resizable()
            .onAppear {
                if self.downloadImageOk == false {
                    self.downLoad()
                }
        }
    }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(url: URL(string: "https://i.some-random-api.ml/LWanWVzxO9.jpg")!)
    }
}
