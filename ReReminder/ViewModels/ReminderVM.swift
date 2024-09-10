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
//    func getReminderSampleList() -> [ReminderVM] {
//        return [getReminderSample(), getReminderSample(), getReminderSample(), getReminderSample()]
//    }
    func getReminderSample() -> ReminderItem {
        return ReminderItem(id: UUID(), title: "Replace Brita Filter", dDay: "D-15", lastdate: Date(), term: .monthly, description: "filter replacement", valid: true)
    }
}
