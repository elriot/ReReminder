//
//  HomeView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-10.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: ReminderVM
    @State var items: [ReminderItem] = []
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
                    ToolbarItem(placement: .navigationBarLeading) { // Correct placement
                        Button {
                            path.append(.add)
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.toolBarButton)
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button {
                            
                        } label: {
                            Image(systemName: "gearshape")
                                .foregroundColor(.toolBarButton)
                        }
                    })
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: NavPath.self) { path in
                    switch path {
                    case .main:
                        ReminderMainView()
                    case .setting:
                        ReminderMainView()
                    case .add:
                        ReminderMainView()
                    case .details(let item):
                        ReminderMainView()
                    }
                }
        }

    }
}

#Preview {
    HomeView()
        .environmentObject(ReminderVM())
}
