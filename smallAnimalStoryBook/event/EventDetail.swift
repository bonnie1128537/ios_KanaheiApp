//
//  EventDetail.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/20.
//  Copyright © 2020 bc. All rights reserved.
//CWB-32EC9ED3-5850-48CC-94B5-F4A317EC3B6B

import SwiftUI

struct EventDetail: View {
    let event: Event
    var body: some View {
        VStack {
            Image(event.title)
                .resizable()
                .scaledToFill()
                .frame(height: 200.0)
                .clipped()
            Text(event.address)
                .multilineTextAlignment(.center)
                .font(Font.custom("jf-openhuninn-1.0", size: 21))
            .padding()
            Spacer()
        }
        .navigationBarTitle(event.title)
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(event: Event(title: "卡娜赫拉的櫻花趣", address: "台中草悟廣場", time: "2020/06/28 14:30:00", gone: true))
    }
}
