//
//  DataStore.swift
//  BucketList
//
//  Created by Eric on 22/05/2023.
//

import Foundation

class DataStore: ObservableObject {
    @Published var bucketList: [BucketItem] = []
    
    init() {
        loadItems()
    }
    
    func loadItems() {
        bucketList = BucketItem.samples
    }
    
    func update(bucketItem: BucketItem, note: String, completedDate: Date) {
        if let index = bucketList.firstIndex(where: {$0.id == bucketItem.id}) {
            bucketList[index].note = note
            bucketList[index].completedDate = completedDate
        }
    }
}
