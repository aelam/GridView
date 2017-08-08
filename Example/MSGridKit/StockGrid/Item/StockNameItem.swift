//
//  StockNameItem.swift
//  MSGridKit
//
//  Created by Ryan Wang on 08/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import MSGridKit

public class StockNameItem: ComplexGridItem {
    var stockName: String = ""
    var stockCode: String = ""
    
    public override init(_ value: Any) {
        super.init(value)
        self.cellClass =  StockNameCell.self
    }
}
