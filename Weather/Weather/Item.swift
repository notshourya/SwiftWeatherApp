//
//  Item.swift
//  Weather
//
//  Created by Shourya Thakur on 18/03/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
