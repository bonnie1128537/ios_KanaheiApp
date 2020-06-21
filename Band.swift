//
//  Band.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/21.
//  Copyright © 2020 bc. All rights reserved.
//

import Foundation

class BandData: ObservableObject{
    @Published var bands = [Band](){
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(bands) {
                UserDefaults.standard.set(data, forKey: "movies")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "movies") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Band].self,from: data) {
                bands = decodedData
            }
        }
     }
}

struct Band: Identifiable, Codable{
    var id = UUID()
    var name:String
    var imageName:String
    var imagePath: String {
        return PhotoData.documentsDirectory.appendingPathComponent(imageName).path
    }
}
