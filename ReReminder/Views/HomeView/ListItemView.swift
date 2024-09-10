//
//  ListViewItem.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import SwiftUI

struct ListItemView: View {
    @EnvironmentObject var vm: ReminderVM
    @Binding var item: ReminderItem

//    @State var isValid = item.valid
    var body: some View {
        HStack {
            VStack(alignment:.leading, spacing: 10){
                HStack(alignment: .top, spacing: 10) {
                    Text(item.title)
                    Spacer()
                    Text(item.dDay)
                }
                HStack {
                    Text("Last done : \(item.lastdate.formattedDate())")
                        .font(.caption)
                }
            }
            
            Toggle(isOn: $item.valid) {
                Text("")            }
            .onChange(of: item.valid) {
                vm.toggleValid(item: &item)
            }
            .labelsHidden()
            .padding()
            .frame(width: 80)
        }
        .frame(height: 60)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListItemView(item : .constant(ReminderVM().getReminderSample()))
}
