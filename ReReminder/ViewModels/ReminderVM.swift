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
            ReminderItem(id: UUID(), title: "Replace Brita Filter", dDay: "D-5", referenceDate: Date() - 35, nextAlertDate: Date() - 35, term: .monthly, description: "filter replacement", valid: true),
            ReminderItem(id: UUID(), title: "Replace Eye drop", dDay: "D-15", referenceDate: Date() - 45, nextAlertDate: Date() - 45, term: .monthly, description: "filter replacement", valid: true),
            ReminderItem(id: UUID(), title: "Replace Air conditioner filter", dDay: "D-20", referenceDate: Date() - 50, nextAlertDate: Date() - 35,term: .monthly, description: "filter replacement", valid: false),
            ReminderItem(id: UUID(), title: "Wash bedding", dDay: "D-25", referenceDate: Date() - 55, nextAlertDate: Date() - 35,term: .monthly, description: "filter replacement", valid: false)
        ]
    }
    func getReminderSample() -> ReminderItem {
        return ReminderItem(id: UUID(), title: "Replace Brita Filter", dDay: "D-15", referenceDate: Date(), nextAlertDate: Date(), term: .monthly, description: "filter replacement", valid: true)
    }
}
