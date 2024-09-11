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
        let bg: Color = item.valid ? .orange : .gray
        let fontColor: Color = item.valid ? .black : .gray
        
        HStack(spacing: 10) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(bg)
                    .frame(width: 50, height: 50)
                    .font(.caption)
                
                VStack {
                    Text("\(item.dDay)")
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
                    Text("Last : \(item.lastdate.formattedDate())")
                        .font(.caption)
                }
            }
            .foregroundColor(fontColor)
            
            VStack(alignment: .trailing, content: {
                Toggle(isOn: $item.valid) {
                    Text("")
                }
                .onChange(of: item.valid) {
                    vm.toggleValid(item: &item)
                }
                .labelsHidden()
                .padding()
            })
        }
        .frame(height: 60)
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListItemView(item : .constant(ReminderVM().getReminderSample()))
}
