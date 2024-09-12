//
//  SimpleWideButton.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-11.
//

import SwiftUI

struct SimpleWideButton: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.toolBarButton)
            
            Button {
                action()
            } label: {
                Text(text)
                    .font(.title2)
                    .fontWeight(.medium)
            }
            .foregroundColor(.white)
        }
        .frame(height: 70)
    }
}

#Preview {
    SimpleWideButton(text: "Add List", action: {})
}
