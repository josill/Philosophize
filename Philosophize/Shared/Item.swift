//
//  Item.swift
//  Philosophize
//
//  Created by Jonathan Sillak on 15.03.2025.
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
