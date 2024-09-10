//
//  ReminderItem.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import Foundation

struct ReminderItem: Hashable, Identifiable {
    var id: UUID
    let title: String
    let dDay: String
    let lastdate: Date
    let term: Term
    let description: String
}
