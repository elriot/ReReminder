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
        }
        .padding(0)
//        .onDelete {
//            
//        }
    }
}

#Preview {
    ListView(items: .constant(ReminderVM().getReminderSampleList()))
}
