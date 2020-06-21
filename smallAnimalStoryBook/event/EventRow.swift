//
//  EventRow.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/20.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct EventRow: View {
    var event: Event

    var body: some View {
        HStack {
            Text("《"+event.title+"》")
            VStack(alignment: .leading) {
                Text("時間：\(event.time)")
            }
            Spacer()
            Image(systemName: event.gone ? "checkmark.seal.fill" : "xmark.seal").foregroundColor(Color(hue: 0.975, saturation: 0.395, brightness: 0.958))
        }
    }

}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: Event(title: "卡娜赫拉的櫻花趣", address: "台中草悟廣場", time: "2020/06/28 14:30:00", gone: true))
        .previewLayout(.sizeThatFits)
    }
}
