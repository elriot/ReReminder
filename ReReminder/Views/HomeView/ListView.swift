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
        List ($items){ $item in
            ListItemView(item: $item)
                .listRowBackground(item.valid ? Color.clear : Color.gray.opacity(0.5))
        }
    }
}

#Preview {
    ListView(items: .constant(ReminderVM().getReminderSampleList()))
}
