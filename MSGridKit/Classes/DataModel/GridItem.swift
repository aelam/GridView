//
//  MSGridItemData.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import Foundation

public protocol GridItemData {
    
}

public class GridItem: NSObject {
    var value: GridItemData
    var data: AnyObject?
    
    public init(_ value: GridItemData) {
        self.value = value
        super.init()
    }
}


extension Double: GridItemData {
    
}

extension Int: GridItemData {
    
}
