//
//  HomeView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import SwiftUI

struct HomeView: View {
    @State var items: [ReminderItem] = [
        ReminderItem(id: UUID(), title: "Replace Brita Filter", dDay: "D-15", lastdate: Date(), term: .monthly, description: "filter replacement", valid: true),
        ReminderItem(id: UUID(), title: "Replace Brita Filter", dDay: "D-15", lastdate: Date(), term: .monthly, description: "filter replacement", valid: true),
        ReminderItem(id: UUID(), title: "Replace Brita Filter", dDay: "D-15", lastdate: Date(), term: .monthly, description: "filter replacement", valid: false),
        ReminderItem(id: UUID(), title: "Replace Brita Filter", dDay: "D-15", lastdate: Date(), term: .monthly, description: "filter replacement", valid: true)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("sdfss");
                ListView(items: $items);
            }
            .navigationTitle("My Home")
        }
    }
}

#Preview {
    HomeView()
}
