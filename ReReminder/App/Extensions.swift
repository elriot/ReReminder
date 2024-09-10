//
//  Extensions.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import Foundation
extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy. MM. dd" 
        return formatter.string(from: self)
    }
    static func +(date: Date, days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: date) ?? date
    }
    
    static func -(date: Date, days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: -days, to: date) ?? date
    }

}
