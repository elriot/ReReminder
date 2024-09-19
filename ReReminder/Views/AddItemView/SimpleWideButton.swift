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
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
        }
        .frame(height: 60)
    }
}

#Preview {
    SimpleWideButton(text: "Add List", action: {})
}
