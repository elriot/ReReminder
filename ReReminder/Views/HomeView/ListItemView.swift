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
    
    func updateValid() {
        vm.updateToggleItem(item, !item.valid)
    }
    var body: some View {
        let bg: Color = item.valid ? .orange : .gray
        let fontColor: Color = item.valid ? .black : .gray
        
        HStack(spacing: 20) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(bg)
                    .frame(width: 50, height: 50)
                    .font(.caption)
                
                VStack {
                    Text("\(item.dDay.dDayToString())")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white) // Text color
                }
            }
            
            VStack(alignment:.leading, spacing: 10){
                HStack(alignment: .top, spacing: 10) {
                    Text("\(item.title)")
                    Spacer()
                }
                .fontWeight(.semibold)
                HStack {
                    Text("Last : \(item.referenceDate.formattedDate())")
                        .font(.caption)
                }
                HStack {
                    Text("Next : \(item.nextAlertDate.formattedDate())")
                        .font(.caption)
                }
                HStack {
                    Text("term : \(item.term.rawValue)")
                        .font(.caption)
                }
            }
            .foregroundColor(fontColor)
            
//            Button("test") {
//                updateValid()
//            }
            
//            VStack(alignment: .trailing, content: {
//                Toggle(isOn: $item.valid) {
//                    Text("")
//                }
//                .onChange(of: item.valid) {
//                    vm.toggleValid(item: &item)
//                }
//                .labelsHidden()
//                .padding()
//            })
        }
        .frame(height: 90)
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListItemView(item : .constant(ReminderVM().getReminderSample()))
}
