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

    var body: some View {
        var bgColor: Color = item.valid ? .clear : .gray
        VStack(spacing: 25) {
            HStack {
                Text("Alarm")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                
                Toggle(isOn: $isOn){
                    
                }
                .padding()
                .onChange(of: isOn) {
                    print("toggle tap")
                }
                
            }
            
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
        
//        .navigationTitle("Detail")
    }
}

#Preview {
    ItemDetailView(item: ReminderVM().getReminderSample(), path: .constant([]))
}
