//
//  DetailView.swift
//  BucketList
//
//  Created by Eric on 22/05/2023.
//

import SwiftUI

struct DetailView: View {
    let bucketItem: BucketItem
    @State private var name = ""
    @State private var note = ""
    @State private var completedDate = Date.distantPast
    @Binding var bucketList: [BucketItem]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
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
            name = bucketItem.name
            note = bucketItem.note
            completedDate = bucketItem.completedDate
        }
        .toolbar {
            ToolbarItem {
                Button("Update") {
                    if let index = bucketList.firstIndex(where: {$0.id == bucketItem.id}) {
                        bucketList[index].name = name
                        bucketList[index].note = note
                        bucketList[index].completedDate = completedDate
                    }
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationTitle(bucketItem.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(bucketItem: BucketItem.samples[2], bucketList: .constant(BucketItem.samples)
            )
        }
    }
}
