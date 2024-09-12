//
//  SimpleDatePicker.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-11.
//

import SwiftUI

struct SimpleDatePicker: View {
    let label: String
    @Binding var targetDate: Date
    
    var body: some View {
        DatePicker(label, selection: $targetDate, displayedComponents: .date)
    }
}

#Preview {
    SimpleDatePicker(label: "Target Date", targetDate: .constant(Date()))
}
