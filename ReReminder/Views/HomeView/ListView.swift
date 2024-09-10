//
//  ListView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import SwiftUI

struct ListView: View {
//    var listItem: [[]]
    var body: some View {
        List {
            ListViewItem(title: "Replace Brita Filter", dDay: "D-15", lastdate: "2024. 09. 30")
            ListViewItem(title: "Replace Brita Filter", dDay: "D-15", lastdate: "2024. 09. 30")
            ListViewItem(title: "Replace Brita Filter", dDay: "D-15", lastdate: "2024. 09. 30")
            ListViewItem(title: "Replace Brita Filter", dDay: "D-15", lastdate: "2024. 09. 30")
            ListViewItem(title: "Replace Brita Filter", dDay: "D-15", lastdate: "2024. 09. 30")
        }
//        .onDelete(perform: { indexSet in
//            for i in indexSet {
//                locationVM.deleteLocation(location: locations[i])
//            }
////                print("delete \(indexSet)")
//        })
    }
}

#Preview {
    ListView()
}
