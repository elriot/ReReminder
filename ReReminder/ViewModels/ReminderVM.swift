//
//  ReminderVM.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import Foundation
import SwiftUI

final class ReminderVM: ObservableObject {
    @Published var reminderItems: [ReminderItem] = []
    private let defaults = UserDefaults.standard
    
    init() {
        self.reminderItems = getReminderItems()
        print("Init: reminderItem \(reminderItems)")
    }
    
    func toggleValid (item: inout ReminderItem) {
        item.valid.toggle()
    }
    
    func addNewItem(title: String, referenceDate: Date, term: Term, description: String){
        var newItem = ReminderItem(title: title, referenceDate: referenceDate, term: term, description: description)
        updateNextAlertDate(for: &newItem)
        updateDDay(for: &newItem)
        appendAndSave(newItem)
    }
    
    func getReminderSampleList() -> [ReminderItem] {
        return [
            ReminderItem(title: "Replace Brita Filter", referenceDate: Date() - 35, term: .monthly, description: "filter replacement"),
            ReminderItem(title: "Replace Eye drop", referenceDate: Date() - 45, term: .monthly, description: "eyedrop replacement"),
            ReminderItem(title: "Wash Bedding", referenceDate: Date() - 5, term: .weekly, description: "eyedrop replacement"),
            ReminderItem(title: "Pay electrocity", referenceDate: Date() - 76, term: .biMonthly, description: "eyedrop replacement"),
            ReminderItem(title: "Pay electrocity", referenceDate: Date() - 76, term: .biMonthly, description: "eyedrop replacement", valid: false)
        ]
    }
    
    func getReminderSample() -> ReminderItem {
        return ReminderItem(title: "Replace Brita Filter", referenceDate: Date() - 35, term: .monthly, description: "filter replacement")
    }
    
    func updateItems() {
        let today = Date()
//        let calendar = Calendar.current
        
        for index in reminderItems.indices {
            var item = reminderItems[index]

            if item.nextAlertDate < today {
                item.nextAlertDate = calculateNextAlertDate(from: item.nextAlertDate, term: item.term)
                updateDDay(for: &item)
            }
            
//            if !calendar.isDate(item.updateDate, inSameDayAs: today) {
//                updateDDay(for: &item)
//            }
            reminderItems[index] = item
        }
    }
    
    func updateDDay(for target: inout ReminderItem) {
        target.dDay = calculateDDay(from: target.nextAlertDate, to: Date())
    }
    
    func calculateDDay(from nextDate: Date, to today: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: today, to: nextDate)
        return components.day ?? 0
    }
    
    func updateNextAlertDate(for target: inout ReminderItem) {
        target.nextAlertDate = calculateNextAlertDate(from: target.nextAlertDate, term: target.term)
    }
    
    func calculateNextAlertDate(from date: Date, term: Term) -> Date {
        let today = Date()
        let calendar = Calendar.current
        var nextDate = date
        
        switch term {
        case .once:
            return nextDate
        case .weekly:
            while nextDate <= today {
                nextDate = calendar.date(byAdding: .day, value: 7, to: nextDate) ?? date
            }
        case .biWeekly:
            while nextDate <= today {
                nextDate = calendar.date(byAdding: .day, value: 14, to: nextDate) ?? date
            }
        case .monthly:
            while nextDate <= today {
                nextDate = calendar.date(byAdding: .month, value: 1, to: nextDate) ?? date
            }
        case .biMonthly:
            while nextDate <= today {
                nextDate = calendar.date(byAdding: .month, value: 2, to: nextDate) ?? date
            }
        case .everyFirstDay:
            while nextDate <= today {
                if let nextMonth = calendar.date(byAdding: .month, value: 1, to: nextDate) {
                    nextDate = calendar.date(from: calendar.dateComponents([.year, .month], from: nextMonth)) ?? nextMonth
                }
            }
        case .everyLastDay:
            while nextDate <= today {
                if let nextMonth = calendar.date(byAdding: .month, value: 1, to: nextDate),
                   let lastDay = calendar.date(byAdding: .day, value: -1, to: calendar.date(from: calendar.dateComponents([.year, .month], from: nextMonth))!) {
                    nextDate = lastDay
                }
            }
        }
        
        return nextDate
    }
    
    private func appendAndSave(_ item: ReminderItem) {
        reminderItems.append(item)
        saveReminderItems()
    }
    
    private func saveReminderItems() {
        do {
            var encoded: [Data] = []
            let encoder = JSONEncoder()
            for item in reminderItems {
                let data = try encoder.encode(item)
                encoded.append(data)
            }
            defaults.set(encoded, forKey: "ReminderItems")
//            print("defauls set reminderItems done")
        } catch {
            print(error)
        }
    }
    
    private func getReminderItems() -> [ReminderItem] {
        guard let data = defaults.object(forKey: "ReminderItems") as? [Data] else {
            return []
        }
        do {
            let decoder = JSONDecoder()
            var items: [ReminderItem] = []
            for item in data {
                let decodedData = try decoder.decode(ReminderItem.self, from: item)
                items.append(decodedData)
            }
            return items
        } catch {
            print("Decoding error: \(error)")
            return []
        }
    }
    
    func delete(_ item: ReminderItem){
        for i in 0..<reminderItems.count {
            guard item == reminderItems[i] else { continue }
            reminderItems.remove(at: i)
            saveReminderItems()
            return
        }
    }
    
    func updateToggleItem(_ item: ReminderItem, _ isValid: Bool) {
        for i in 0..<reminderItems.count {
            if item.id == reminderItems[i].id {
                var item = reminderItems[i]
                item.valid = isValid
                reminderItems[i] = item
                saveReminderItems()
                print("updated to (from vm:) ! \(reminderItems[i].valid)")
                break
            }
        }
    }
    
    func refreshItems(){
        let items = self.reminderItems
        self.reminderItems = []
        self.reminderItems = items
    }
}
