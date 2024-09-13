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
    @State var isOn: Bool = false
    
    func updateValid() {
        print("update valid")
        vm.updateToggleItem(item)
    }

    var body: some View {
        let bgColor: Color = item.valid ? .clear : .gray
        VStack(spacing: 25) {
            ItemDetailToggleButtonView(label: "Alarm", action: {}, isOn: $isOn)
            
            ItemDetailLabelContentView(label: "Title", content: item.title
            )
            
            ItemDetailLabelContentView(label: "Description", content: item.description
            )
            Text(item.description)
            Text("\(item)")
            
            Spacer()
        }
        .padding()
        .background(bgColor)
        .navigationTitle(item.dDay.dDayToString())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
//                    alertVisible = true
                } label: {
                    Image(systemName: "highlighter")
                        .foregroundColor(.toolBarButton)
                }
            }
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
        .onAppear {
            isOn = item.valid
        }
        
//        .navigationTitle("Detail")
    }
}

#Preview {
    ItemDetailView(item: ReminderVM().getReminderSample(), path: .constant([]))
}
