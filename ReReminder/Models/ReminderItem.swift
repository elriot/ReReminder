//
//  ReminderItem.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import Foundation

struct ReminderItem: Hashable, Identifiable, Codable {
    var id: UUID
    var title: String
    var dDay: Int // if it's 5 it means nextAlertDate - 5 same with "D-5"
    var referenceDate: Date
    var nextAlertDate: Date
    var term: Term
    var description: String
    var valid: Bool
    var updateDate: Date
    
    init(title: String, referenceDate: Date, term: Term, description: String) {
        self.id = UUID()
        self.title = title
        self.referenceDate = referenceDate
        self.term = term
        self.description = description
        self.valid = true
        self.updateDate = Date()
        self.dDay = 0
        self.nextAlertDate = Date()
    }
    //for test
    init(title: String, referenceDate: Date, term: Term, description: String, valid: Bool) {
        self.id = UUID()
        self.title = title
        self.referenceDate = referenceDate
        self.term = term
        self.description = description
        self.valid = valid
        self.updateDate = Date()
        self.dDay = 0
        self.nextAlertDate = updateDate - 1
    }
}
