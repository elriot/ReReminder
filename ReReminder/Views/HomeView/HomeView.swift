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
        }
        .navigationTitle("My Home")
        .navigationDestination(for: NavPath.self) { path in
//            switch path {
//            case .add:
////                    NewItemView(path: $path)
//            case .details(let item):
////                    ItemDetailsView(item: item, path: $path)
//            case .userInfo:
////                    UserViewInfo(path: $path)
//            }
        }

    }
}

#Preview {
    HomeView()
        .environmentObject(ReminderVM())
}
