//
//  Event.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/20.
//  Copyright © 2020 bc. All rights reserved.
//

import Foundation

struct Event: Identifiable, Codable {
    let id = UUID()
    var title: String
    var address: String
    var category: Int
    var gone: Bool
    
    #if DEBUG
    static let demoEvent = Event(title: "兔兔", address: "000", category: 0, gone: true)
    #endif
}
