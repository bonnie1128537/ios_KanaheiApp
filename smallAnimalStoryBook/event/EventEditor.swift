//
//  EventEditor.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/20.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct EventEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var eventsData: EventsData
    @State private var title = ""
    @State private var address = ""
    @State private var category = 0
    @State private var gone = true
    let categories=["台北市","新北市","台中市","高雄市"]
    @State private var showBlankAlert = false
    var editEventIndex: Int?

    var body: some View {
        Form {
                TextField("展覽名稱", text: $title)
                TextField("展覽地址", text: $address)
                categoryType(category: self.$category)
                Toggle("已去", isOn: $gone)
            }
            .navigationBarTitle("新增新展覽")
            .navigationBarItems(trailing: Button("儲存") {
                
                let event = Event(title: self.title, address: self.address, category: self.category, gone: self.gone)
                
                if let editEventIndex = self.editEventIndex {
                    
                    self.eventsData.events[editEventIndex] = event
                } else {
                    self.eventsData.events.insert(event, at: 0)
                }

                
                self.presentationMode.wrappedValue.dismiss()
            })
                .onAppear {
                    
                    if let editEventIndex = self.editEventIndex {
                        let editEvent = self.eventsData.events[editEventIndex]
                        self.title = editEvent.title
                        self.address = editEvent.address
                        self.category = editEvent.category
                        self.gone = editEvent.gone
                    }
        }
    }
}

struct EventEditor_Previews: PreviewProvider {
    static var previews: some View {
        EventEditor(eventsData: EventsData())
    }
}

struct categoryType: View
{
    @Binding var category: Int
    let categories=["台北市","新北市","台中市","高雄市"]
    var body: some View
    {
        Picker(selection: $category, label: Text("地區")){
            ForEach(0..<categories.count) { (idx) in
                Text(self.categories[idx])
            }
        }.pickerStyle(WheelPickerStyle())
    }
}
