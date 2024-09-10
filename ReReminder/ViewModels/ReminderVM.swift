//
//  ReminderVM.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import Foundation

final class ReminderVM: ObservableObject {
    func toggleValid (item: inout ReminderItem) {
        item.valid.toggle()
    }
}
