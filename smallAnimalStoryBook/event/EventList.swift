//
//  EventList.swift
//  smallAnimalStoryBook
//
//  Created by User06 on 2020/6/20.
//  Copyright © 2020 bc. All rights reserved.
//

import SwiftUI

struct EventList: View {
    @ObservedObject var eventsData = EventsData()
    @State private var showEditEvent = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(eventsData.events.indices, id: \.self) { (index) in
                    NavigationLink(destination: EventDetail(event: self.eventsData.events[index])) {
                        EventRow(event: self.eventsData.events[index])
                    }
                }
                .onMove { (indexSet, index) in
                    self.eventsData.events.move(fromOffsets: indexSet,
                                    toOffset: index)
                }
                .onDelete { (indexSet) in
                    self.eventsData.events.remove(atOffsets: indexSet)
                }
                .listRowInsets(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 30))
            }
            .navigationBarTitle("展覽列表")
            .navigationBarItems(leading: EditButton() , trailing: Button(action: {
                self.showEditEvent = true
            }) {
                Image(systemName: "plus.circle.fill")
            })
                .sheet(isPresented: $showEditEvent) {
                    NavigationView {
                        EventEditor(eventsData: self.eventsData)

                    }
            }
        }
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
