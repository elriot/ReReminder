//
//  ItemDetailToggleButtonView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-13.
//

import SwiftUI

struct ItemDetailToggleButtonView: View {
    let label: String
    let action: () -> Void
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Text(label)
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            
            Toggle(isOn: $isOn) {
                // Empty label for toggle
            }
            .padding()
            .onChange(of: isOn) {
                // This should trigger when `isOn` changes
//                print("Toggle changed to: \(newVal)")
                action()
            }
        }
        .padding()
    }
}

#Preview {
    ItemDetailToggleButtonView(label: "Alarm", action: {
        print("Action called")
    }, isOn: .constant(true))
}
