//
//  NavPath.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-11.
//

import SwiftUI

enum NavPath: Hashable {
    case main
    case setting
    case add
    case details(ReminderItem)
}
