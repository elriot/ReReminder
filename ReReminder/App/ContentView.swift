//
//  ContentView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-09.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ReminderVM()
    var body: some View {
        NavigationView {
            VStack {
                HomeView()
                    .environmentObject(vm)
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button {
                        //                        showLogout = true
                        //                    path.append(.userInfo)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.toolBarButton)
                    }
                })
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button {
                        //                        showLogout = true
                        //                    path.append(.userInfo)
                    } label: {
                        Image(systemName: "gearshape")
                            .foregroundColor(.toolBarButton)
                    }
                })
            }
        }
        
    }
}

#Preview {
    ContentView()
}
