//
//  Item.swift
//  Organize
//
//  Created by Jai Pannu on 29/01/24.
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
