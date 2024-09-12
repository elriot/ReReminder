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
    var referenceDate: Date
    var nextAlertDate: Date
    var term: Term
    var description: String
    var valid: Bool
    
}
