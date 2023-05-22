//
//  DetailView.swift
//  BucketList
//
//  Created by Eric on 22/05/2023.
//

import SwiftUI

struct DetailView: View {
    let bucketItem: BucketItem
    @State private var note = ""
    @State private var completedDate = Date.distantPast
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            TextField("Bucket Note", text: $note, axis: .vertical)
            if completedDate != Date.distantPast {
                DatePicker("Completed on", selection: $completedDate, displayedComponents: .date)
            }
            Button( completedDate == Date.distantPast ? "Add Date" : "Clear Date") {
                if completedDate == Date.distantPast {
                    completedDate = Date()
                } else {
                    completedDate = Date.distantPast
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .onAppear {
            note = bucketItem.note
            completedDate = bucketItem.completedDate
        }
        .toolbar {
            ToolbarItem {
                Button("Update") {
                    dismiss()
                }
            }
        }
        .navigationTitle(bucketItem.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(bucketItem: BucketItem.samples[2])
        }
    }
}
