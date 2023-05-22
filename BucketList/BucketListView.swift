//
//  BucketListView.swift
//  BucketList
//
//  Created by Eric on 20/05/2023.
//

import SwiftUI

struct BucketListView: View {
    @EnvironmentObject var dataStore: DataStore
    @State private var newItem = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("New Bucket Item", text: $newItem)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        let newBucketItem  = BucketItem(name: newItem)
                        dataStore.bucketList.append(newBucketItem)
                        newItem = ""
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newItem.isEmpty)
                }
                .padding()
                
                List {
                    ForEach($dataStore.bucketList) { $item in
                        NavigationLink(value: item) {
                            TextField(item.name, text: $item.name, axis: .vertical)
                                .textFieldStyle(.roundedBorder)
                                .font(.title3)
                                .foregroundColor(item.completedDate == .distantPast ? .primary : .red)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .onDelete { indexSet in
                        dataStore.bucketList.remove(atOffsets: indexSet)
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Bucket List")
                .navigationDestination(for: BucketItem.self) { item in
                    DetailView(bucketItem: item)
                }
            }
        }
    }
}

struct BucketListView_Previews: PreviewProvider {
    static var previews: some View {
        BucketListView()
            .environmentObject(DataStore())
    }
}
