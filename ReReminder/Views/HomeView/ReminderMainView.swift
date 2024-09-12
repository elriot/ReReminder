//
//  ReminderMainView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-11.
//

import SwiftUI

struct ReminderMainView: View {
    @EnvironmentObject var vm: ReminderVM
    @State var text: String = ""
    
    func submit() {
        print("search : \(text)")
    }
    
    var body: some View {
        VStack {
            SearchTextField(placeholder: "Search title..", action: submit, text: $text)
                .padding()
            
            ListView(items: $vm.reminderItems);
        }
    }
}

#Preview {
    ReminderMainView()
        .environmentObject(ReminderVM())
}
