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
    var updateDate: Date
    
    init(title: String, referenceDate: Date, term: Term, description: String) {
        self.id = UUID() // Generate a new UUID
        self.title = title
        self.referenceDate = referenceDate
        self.term = term
        self.description = description
        
        self.dDay = "D-0"
        self.nextAlertDate = calculateNextAlertDate()
        self.valid = true // Default value
        self.updateDate = Date() // Set to the current date
    }
    
    func calculateNextAlertDate() -> Date {
        let today: Date = Date()
        let calendar = Calendar.current
        var updateDate = referenceDate
        
        switch term {
        case .once:
            updateDate = referenceDate
        case .weekly:
            while(nextAlertDate < today){
                updateDate = calendar.date(byAdding: .day, value: 7, to: self.nextAlertDate) ?? referenceDate
            }
        case .biWeekly:
            while(nextAlertDate < today){
                updateDate = calendar.date(byAdding: .day, value: 14, to: self.nextAlertDate) ?? referenceDate
            }
        case .monthly:
            while(nextAlertDate < today){
                updateDate = calendar.date(byAdding: .month, value: 1, to: self.nextAlertDate) ?? referenceDate
            }
        case .biMonthly:
            while(nextAlertDate < today){
                updateDate = calendar.date(byAdding: .month, value: 2, to: self.nextAlertDate) ?? referenceDate
            }
        case .everyFirstDay:
            while nextAlertDate < today {
                if let nextMonth = calendar.date(byAdding: .month, value: 1, to: nextAlertDate) {
                    updateDate = calendar.date(from: calendar.dateComponents([.year, .month], from: nextMonth)) ?? nextMonth
                }
            }
        case .everyLastDay:
            while nextAlertDate < today {
                if let nextMonth = calendar.date(byAdding: .month, value: 1, to: nextAlertDate),
                   let lastDay = calendar.date(byAdding: .day, value: -1, to: calendar.date(from: calendar.dateComponents([.year, .month], from: nextMonth))!) {
                    updateDate = lastDay
                }
            }
        }
        
        return updateDate;
    }
}
