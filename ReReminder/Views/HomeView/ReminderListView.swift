//
//  ReminderListView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-11.
//

import SwiftUI

struct ReminderListView: View {
    @EnvironmentObject var vm: ReminderVM
//    @Binding var items: [ReminderItem]
    @State var text: String = ""
    @State var items: [ReminderItem] = []
    
    func submit() {
        print("search : \(text)")
    }
    
    var body: some View {
        VStack {
            SearchTextField(placeholder: "Search title..", action: submit, text: $text)
                .padding()
            
            List ($items){ $item in
                NavigationLink(value: NavPath.details(item)) {
                    ListItemView(item: $item)
                }
            }
            Button("Label") {
                print(vm.reminderItems)
            }
        }
        .onAppear {
            items = vm.reminderItems
        }
    }
}

#Preview {
    ReminderListView()
        .environmentObject(ReminderVM())
}
