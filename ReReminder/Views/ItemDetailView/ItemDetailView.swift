//
//  ItemDetailView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-12.
//

import SwiftUI

struct ItemDetailView: View {
    let item: ReminderItem
    @EnvironmentObject var vm: ReminderVM
    @Binding var path: [NavPath]
    @State var alertVisible: Bool = false
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.description)
            Text("\(item)")
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    alertVisible = true
                } label: {
                    Image(systemName: "trash.fill")
                        .foregroundColor(.toolBarButton)
                }
            }
        }
        .alert("Delete Reminder", isPresented: $alertVisible) {
            Button("Delete") {
                vm.delete(item)
                path.removeLast()
            }
            Button("Cancel", role: .cancel) {
                print("Cancelled")
            }
        } message: {
            Text("Are you sure you want to delete this reminder?")
        }
        
//        .navigationTitle("Detail")
    }
}

#Preview {
    ItemDetailView(item: ReminderVM().getReminderSample(), path: .constant([]))
}
