//
//  HomeView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: ReminderVM
    @State var text: String = ""
    @State private var path: [NavPath] = []
    
    func submit() {
        print("search : \(text)")
    }
    
    var body: some View {
        NavigationStack(path: $path){
            ReminderListView()
                .navigationTitle("Home")
                .toolbar {
                    addToolbarItems()
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: NavPath.self) { path in
                    destinationView(for: path)
                }
        }
    }
    func printYo() {
        print(vm.reminderItems)
    }
    
    @ToolbarContentBuilder
    private func addToolbarItems() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                path.append(.add)
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.toolBarButton)
            }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                path.append(.setting)
            } label: {
                Image(systemName: "gearshape")
                    .foregroundColor(.toolBarButton)
            }
        }
    }
    
    @ViewBuilder
    func destinationView(for path: NavPath) -> some View {
        switch path {
        case .main:
            ReminderListView()
        case .setting:
            ReminderListView()
        case .add:
            AddItemView(path: $path)
        case .details(let item):
            if let index = vm.reminderItems.firstIndex(where: { $0.id == item.id }) {
                ItemDetailView(path: $path, item: $vm.reminderItems[index])
            } else {
                Text("Item not found")
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ReminderVM())
}
