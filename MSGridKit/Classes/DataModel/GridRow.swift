//
//  MSGridRowData.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import UIKit

public class GridRow: NSObject {
    var items: [GridItem]?
    
    public convenience init(_ values: [GridItemData]) {
        var newItems = [GridItem]()
        
        for i in 0..<values.count {
            let item = GridItem(values[i])
            newItems.append(item)
        }
        
        self.init(newItems)
    }
    
    @objc(initWithItems:)
    public init(_ items: [GridItem]?) {
        super.init()
        self.items = items
    }
    
    subscript(column: Int) -> GridItem? {
        guard let items = items else {
            return nil
        }
        return column < items.count ? items[column] : nil
    }
}
