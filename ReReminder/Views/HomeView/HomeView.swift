//
//  HomeView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: ReminderVM
//    @State var items: [ReminderItem] = []
    @State var text: String = ""
    @State private var path: [NavPath] = []
    
    func submit() {
        print("search : \(text)")
    }
    
    var body: some View {
        NavigationStack(path: $path){
            ReminderMainView()
                .navigationTitle("Home")
                .toolbar {
                    addToolbarItems()
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: NavPath.self) { path in
                   destinationView(for: path)
                }
        }
        .onAppear {
//            printYo()
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
            ReminderMainView()
        case .setting:
            ReminderMainView()
        case .add:
            AddItemView()
        case .details(let item):
            ReminderMainView()
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ReminderVM())
}
