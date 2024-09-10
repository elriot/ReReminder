//
//  ListViewItem.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import SwiftUI

struct ListViewItem: View {
    let title: String, dDay: String, lastdate: String
    var body: some View {
        VStack(alignment:.leading, spacing: 10){
            HStack(alignment: .top, spacing: 10) {
                Text(title)
                Spacer()
                Text(dDay)
            }
            HStack {
                Text("Last done : \(lastdate)")
                    .font(.caption)
            }
        }
        .frame(height: 60)
    }
}

#Preview {
    ListViewItem(title: "Replace Brita Filter", dDay: "D-15", lastdate: "2024. 09. 30")
}
