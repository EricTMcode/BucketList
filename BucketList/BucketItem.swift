//
//  BucketItem.swift
//  BucketList
//
//  Created by Eric on 22/05/2023.
//

import Foundation

struct BucketItem: Codable, Identifiable {
    var id = UUID()
    var name: String
    var note = ""
    var completedDate = Date.distantPast
    
    static var samples: [BucketItem] {
        [
        BucketItem(name: "Climb Mt Everest"),
        BucketItem(name: "Visite Hawaii", note: "Go to Maui and Oahu"),
        BucketItem(name: "Get Married", note: "Found the love og my life", completedDate: Date())
        ]
    }
}
