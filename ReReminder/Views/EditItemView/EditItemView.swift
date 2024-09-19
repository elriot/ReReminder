//
//  EditItemView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-19.
//

import SwiftUI

struct EditItemView: View {
    @EnvironmentObject var vm: ReminderVM
    @Binding var path: [NavPath]
    @Binding var item: ReminderItem
    var body: some View {
        VStack {
            Text("edit")
            Text(item.title)
        }
    }
}


#Preview {
    EditItemView(path: .constant([]), item: .constant(ReminderVM().getReminderSample()))
        .environmentObject(ReminderVM())
}
