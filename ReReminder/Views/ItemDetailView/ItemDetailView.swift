//
//  ItemDetailView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-12.
//

import SwiftUI

struct ItemDetailView: View {
    let item: ReminderItem
    @Binding var path: [NavPath]
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.description)
            Text("\(item)")
        }
//        .navigationTitle("Detail")
    }
}

#Preview {
    ItemDetailView(item: ReminderVM().getReminderSample(), path: .constant([]))
}
