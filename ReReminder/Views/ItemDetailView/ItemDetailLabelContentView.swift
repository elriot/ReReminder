//
//  ItemDetailLabelContentView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-13.
//

import SwiftUI

struct ItemDetailLabelContentView: View {
    let label: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .font(.title)
                .fontWeight(.semibold)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(height: 40)
                
                HStack {
                    Text(content)
                        .font(.title3)
                    Spacer()
                }
                .padding()
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ItemDetailLabelContentView(label: "Title", content: "Change Brita Filter")
}
