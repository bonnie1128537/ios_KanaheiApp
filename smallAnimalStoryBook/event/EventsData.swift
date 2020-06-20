//
//  EventsData.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/20.
//  Copyright © 2020 bc. All rights reserved.
//

import Foundation

class EventsData: ObservableObject {
    @Published var events = [Event](){
        didSet{
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(events){
                UserDefaults.standard.set(data, forKey:"events")
            }
        }
    }
    
    init(){
        if let data =
            UserDefaults.standard.data(forKey:"events"){
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Event].self, from:data){
                events = decodedData
            }
        }
    }
}
