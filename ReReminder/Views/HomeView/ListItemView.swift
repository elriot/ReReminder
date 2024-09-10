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
                Text("") // Toggle 라벨 제공
            }
            .onChange(of: item.valid) { newValue in
                vm.toggleValid(item: &item) // Toggle 값 변경 시 함수 호출
            }
            .labelsHidden()
            .padding()
            .frame(width: 80)
        }
        .frame(height: 60)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListItemView(item : .constant(ReminderItem(id: UUID(), title: "Replace Brita Filter", dDay: "D-15", lastdate: Date(), term: .monthly, description: "filter replacement", valid: true)))
}
