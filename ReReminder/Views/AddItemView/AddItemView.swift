//
//  AddItemView.swift
//  ReReminder
//
//  Created by SOOPIN KIM on 2024-09-11.
//

import SwiftUI

struct AddItemView: View {
    @State var title: String = ""
    @State var description: String = ""
    @State private var term: Term = .once
    @State var titleMissingAlertVisible: Bool = false
    @State var date: Date = Date()
    private let spacing: CGFloat = 15
    
    func submit() {
        if(title == ""){
            titleMissingAlertVisible = true
            return;
        }
        print("submit")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            
            VStack(alignment: .leading, spacing: spacing){
                HStack(spacing: 5) {
                    Text("Title")
                    Text("(*Required)")
                        .font(.footnote)
                        .foregroundColor(.blue)
//                        .foregroundStyle(.gray)
                }
                
        
                SimpleTextField(placeholder: "Enter Title", text: $title)
            }
            
            
            VStack(alignment: .leading, spacing: spacing){
                Text("Term")
                
                TermPickerView(term: $term)
            }
            
            VStack(alignment: .leading, spacing: spacing){
                Text("Description")
                
                SimpleTextField(placeholder: "Enter Description", text: $description)
            }
            
            VStack(alignment: .leading, spacing: spacing){
                SimpleDatePicker(label:"Start Date",targetDate: $date)
//                SimpleTextField(placeholder: "Enter Description", text: $description)
            }
            
            Spacer()
            
            SimpleWideButton(text: "Add List", action: submit)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .alert("Title is required", isPresented: $titleMissingAlertVisible) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Please enter a title before submitting.")
        }
    }
}

#Preview {
    AddItemView()
}
