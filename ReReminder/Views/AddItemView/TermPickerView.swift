//
//  TermPickerView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-11.
//

import SwiftUI

struct TermPickerView: View {
    @Binding var term: Term
    
    var body: some View {
        Picker("Select Term", selection: $term) {
            ForEach(Term.allCases) { term in
                Text(term.rawValue).tag(term)
            }
        }
        .pickerStyle(MenuPickerStyle())
//        .accentColor(.blue)
    }
}

#Preview {
    TermPickerView(term: .constant(.weekly))
}
