//
//  MSGridRowData.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import UIKit

class GridRow: NSObject {
    var items: [GridItem]?
    
    subscript(column: Int) -> GridItem? {
        guard let items = items else {
            return nil
        }
        return column < items.count ? items[column] : nil
    }
}
