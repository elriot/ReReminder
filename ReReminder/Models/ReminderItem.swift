//
//  ReminderItem.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import Foundation

struct ReminderItem: Hashable, Identifiable {
    var id: UUID
    var title: String
    var dDay: String
    var lastdate: Date
    var term: Term
    var description: String
    var valid: Bool
    
    static func getReminderSample() -> ReminderItem {
        return ReminderItem(
            id: UUID(),
            title: "Replace Brita Filter",
            dDay: "D-15",
            lastdate: Date(),
            term: .monthly,
            description: "Filter replacement reminder",
            valid: true
        )
    }
}
