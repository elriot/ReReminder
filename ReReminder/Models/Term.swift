//
//  Term.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import Foundation
enum Term: String, CaseIterable, Identifiable, Codable {
    case once = "Once"
    case weekly = "Weekly"
    case biWeekly = "Bi-Weekly"
    case monthly = "Monthly"
    case biMonthly = "Bi-Monthly"
    case everyFirstDay = "Every first day of the month"
    case everyLastDay = "Every last day of the month"
    
    var id: String { self.rawValue } 
}
