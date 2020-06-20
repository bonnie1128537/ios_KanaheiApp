//
//  EventDetail.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/20.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct EventDetail: View {
    let event: Event
    var body: some View {
        VStack {
            /*
            Image(event.ename)
                .resizable()
                .scaledToFill()
                .frame(height: 370.0)
                .clipped()
            */
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
        EventDetail(event: Event(title: "卡娜赫拉的櫻花趣", address: "台中草悟廣場", category: 0, gone: true))
    }
}
