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
        reminderItems = getReminderSampleList()
        updateItems()
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
    
    func updateItems () {
        let today = Date()
        let calendar = Calendar.current
        
        for index in reminderItems.indices {
            let item = reminderItems[index]
            
            
            if !calendar.isDate(item.updateDate, inSameDayAs: today) {
                updateDDay(target: &reminderItems[index])
            }
        }
    }
    
    func updateDDay(target: inout ReminderItem) {
        let today = Date()
        let nextAlertDate = target.nextAlertDate
        target.dDay = calculateDDay(from: nextAlertDate, today: today)
    }
    
    func calculateDDay(from nextDate: Date, today: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: today, to: nextDate)
        guard let days = components.day else { return 0 }
        return days >= 0 ? days : 0
    }
}
