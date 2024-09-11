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
        HomeView()
            .environmentObject(vm)
    }
}

#Preview {
    ContentView()
}
