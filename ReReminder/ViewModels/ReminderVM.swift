//
//  ReminderVM.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import Foundation

final class ReminderVM: ObservableObject {
    @Published var reminderItems: [ReminderItem] = []
    
    init(){
        
    }
    func toggleValid (item: inout ReminderItem) {
        item.valid.toggle()
    }
    func getReminderSampleList() -> [ReminderItem] {
        return [
            ReminderItem(title: "Replace Brita Filter", referenceDate: Date() - 35, term: .monthly, description: "filter replacement"),
            ReminderItem(title: "Replace Eye drop", referenceDate: Date() - 45, term: .monthly, description: "eyedrop replacement"),
            ReminderItem(title: "Wash Bedding", referenceDate: Date() - 5, term: .weekly, description: "eyedrop replacement"),
            ReminderItem(title: "Pay electrocity", referenceDate: Date() - 76, term: .biMonthly, description: "eyedrop replacement"),
        ]
    }
    func getReminderSample() -> ReminderItem {
        return ReminderItem(title: "Replace Brita Filter", referenceDate: Date() - 35, term: .monthly, description: "filter replacement")
    }
}
