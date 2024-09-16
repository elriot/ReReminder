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
    @State var bgColor: Color = .clear
    
    func updateValid() {
        print("isOn.toggle", isOn)
//        print("update valid, before: \(item.valid)")
//        vm.updateToggleItem(item)
//        print("update valid, after: \(item.valid)")
    }

    var body: some View {
        VStack(spacing: 25) {
            ItemDetailToggleButtonView(label: "Alarm", action: updateValid, isOn: $isOn)
            
            ItemDetailLabelContentView(label: "Title", content: item.title
            )
            
            ItemDetailLabelContentView(label: "Description", content: item.description
            )
            Text(item.description)
            Text("\(item)")
            Text("Valid \(item.valid)")
            Spacer()
            Button("Label") {
                print(vm.reminderItems)
            }
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
            bgColor = item.valid ? .clear : .gray
        }
        
//        .navigationTitle("Detail")
    }
}

#Preview {
    ItemDetailView(item: ReminderVM().getReminderSample(), path: .constant([]))
        .environmentObject(ReminderVM())
}
