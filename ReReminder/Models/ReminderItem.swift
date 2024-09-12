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
        self.nextAlertDate = updateDate
    }
//    
//    private func calculateNextAlertDate(date: Date, term: Term) -> Date {
//        let today = Date()
//        let calendar = Calendar.current
//        var nextDate = date
//        
//        switch term {
//        case .once:
//            return nextDate
//        case .weekly:
//            while nextDate < today {
//                nextDate = calendar.date(byAdding: .day, value: 7, to: nextDate) ?? date
//            }
//        case .biWeekly:
//            while nextDate < today {
//                nextDate = calendar.date(byAdding: .day, value: 14, to: nextDate) ?? date
//            }
//        case .monthly:
//            while nextDate < today {
//                nextDate = calendar.date(byAdding: .month, value: 1, to: nextDate) ?? date
//            }
//        case .biMonthly:
//            while nextDate < today {
//                nextDate = calendar.date(byAdding: .month, value: 2, to: nextDate) ?? date
//            }
//        case .everyFirstDay:
//            while nextDate < today {
//                if let nextMonth = calendar.date(byAdding: .month, value: 1, to: nextDate) {
//                    nextDate = calendar.date(from: calendar.dateComponents([.year, .month], from: nextMonth)) ?? nextMonth
//                }
//            }
//        case .everyLastDay:
//            while nextDate < today {
//                if let nextMonth = calendar.date(byAdding: .month, value: 1, to: nextDate),
//                   let lastDay = calendar.date(byAdding: .day, value: -1, to: calendar.date(from: calendar.dateComponents([.year, .month], from: nextMonth))!) {
//                    nextDate = lastDay
//                }
//            }
//        }
//        
//        return nextDate
//    }
//    
//    private func calculateDDay(from nextDate: Date) -> String {
//        let calendar = Calendar.current
//        let components = calendar.dateComponents([.day], from: Date(), to: nextDate)
//        guard let days = components.day else { return "D-0" }
//        return days >= 0 ? "D-\(days)" : "D+0"
//    }
}
