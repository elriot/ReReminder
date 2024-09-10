//
//  ListView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import SwiftUI

struct ListView: View {
    @Binding var items: [ReminderItem]
    var body: some View {
//        List($items){ $item in
////            NavigationLink(value: NavPath.details(item)) {
////                ListItemView(item: item, height: 100)
////            }
//            
//        }
        List ($items){ $item in
            ListItemView(item: $item)
        }
        
//            ListViewItem(title: "Replace Brita Filter", dDay: "D-15", lastdate: "2024. 09. 30")
//            ListViewItem(title: "Replace Brita Filter", dDay: "D-15", lastdate: "2024. 09. 30")
//            ListViewItem(title: "Replace Brita Filter", dDay: "D-15", lastdate: "2024. 09. 30")
//            ListViewItem(title: "Replace Brita Filter", dDay: "D-15", lastdate: "2024. 09. 30")
//        }
//        .onDelete(perform: { indexSet in
//            for i in indexSet {
//                locationVM.deleteLocation(location: locations[i])
//            }
////                print("delete \(indexSet)")
//        })
    }
}

#Preview {
    ListView(items: .constant([
        ReminderItem(id: UUID(), title: "Replace Brita Filter", dDay: "D-15", lastdate: Date(), term: .monthly, description: "filter replacement"),
        ReminderItem(id: UUID(),title: "Replace Brita Filter", dDay: "D-15", lastdate: Date(), term: .monthly, description: "filter replacement"),
        ReminderItem(id: UUID(),title: "Replace Brita Filter", dDay: "D-15", lastdate: Date(), term: .monthly, description: "filter replacement"),
        ReminderItem(id: UUID(),title: "Replace Brita Filter", dDay: "D-15", lastdate: Date(), term: .monthly, description: "filter replacement")
    ])
    )
}
