//
//  ItemDetailView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-12.
//

import SwiftUI

struct ItemDetailView: View {
    @EnvironmentObject var vm: ReminderVM
    @Binding var path: [NavPath]
    @Binding var item: ReminderItem
    @State var alertVisible: Bool = false
    @State var isOn: Bool = false
    @State var bgColor: Color = .clear
    
    func updateValid() {
        print("isOn Changed: \(isOn)")
        vm.updateToggleItem(item, isOn)
    }

    var body: some View {
//        ScrollView(.vertical) {
            VStack(spacing: 25) {
                ItemDetailToggleButtonView(label: "Alarm", action: updateValid, isOn: $isOn)
                
                ItemDetailLabelContentView(label: "Title", content: item.title
                )
                
                ItemDetailLabelContentView(label: "Description", content: item.description
                )
                ItemDetailLabelContentView(label: "Reference Date", content: item.referenceDate.formattedDate()
                )
                
                ItemDetailLabelContentView(label: "Latest Alert Date", content: item.referenceDate.formattedDate()
                )
                ItemDetailLabelContentView(label: "Coming Alert Date", content: item.referenceDate.formattedDate()
                )
                
                Spacer()
                
                SimpleWideButton(text: "Edit") {
                    path.append(.edit(item))
                }
                
//                ZStack {
//                    RoundedRectangle(cornerRadius: 10)
//                        .foregroundColor(.buttonRect)
//                    
//                    Button {
//
//                    } label: {
//                        Image(systemName: "highlighter")
//                        Text("Edit")
//                    }
//                    .foregroundColor(.black)
//                }
//                .frame(height: 40)

//                Button("Label") {
//                    print(vm.reminderItems)
//                    dump("item : \(item)")
//                }
            }

//        }
        .padding()
        .background(bgColor)
        .navigationTitle(item.dDay.dDayToString())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//    //                    alertVisible = true
//                    } label: {
//                        Image(systemName: "highlighter")
//                            .foregroundColor(.toolBarButton)
//                    }
//                }
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
            bgColor = isOn ? .clear : .gray
        }
        .onChange(of: isOn) {
            bgColor = isOn ? .clear : .gray
        }
    }
}

#Preview {
    ItemDetailView(path: .constant([]), item: .constant(ReminderVM().getReminderSample()))
        .environmentObject(ReminderVM())
}
