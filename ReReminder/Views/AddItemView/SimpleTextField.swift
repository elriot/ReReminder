//
//  SimpleTextField.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-11.
//

import SwiftUI

struct SimpleTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            HStack {
                TextField(placeholder, text: $text)
                    .submitLabel(.done)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .background(.clear)
            }
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray.opacity(0.1), lineWidth: 0.3)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.gray.opacity(0.1))
                )
        )
    }
}

#Preview {
    SimpleTextField(placeholder: "Enter title", text: .constant(""))
}
