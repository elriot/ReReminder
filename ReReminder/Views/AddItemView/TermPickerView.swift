//
//  TermPicker.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-11.
//

import SwiftUI

struct TermPickerView: View {
    @Binding var term: Term

    var body: some View {
        VStack {
            Picker("Select Term", selection: $term) {
                ForEach(Term.allCases) { term in
                    Text(term.rawValue).tag(term)
                }
            }
            .pickerStyle(MenuPickerStyle()) // Displays as a dropdown menu
            .padding()
        }
    }
}

#Preview {
    TermPickerView(term: .constant(.weekly))
}
