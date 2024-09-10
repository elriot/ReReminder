//
//  ListViewItem.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import SwiftUI

struct ListItemView: View {
    @Binding var item: ReminderItem
    var body: some View {
        VStack(alignment:.leading, spacing: 10){
            HStack(alignment: .top, spacing: 10) {
                Text(item.title)
                Spacer()
                Text(item.description)
            }
            HStack {
                Text("Last done : \(item.lastdate)")
                    .font(.caption)
            }
        }
        .frame(height: 60)
    }
}

#Preview {
    ListItemView(item : .constant(ReminderItem(id: UUID(), title: "Replace Brita Filter", dDay: "D-15", lastdate: Date(), term: .monthly, description: "filter replacement")))
}
