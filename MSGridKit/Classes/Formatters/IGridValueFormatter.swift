//
//  IGridValueFormatter.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import Foundation

public protocol IGridValueFormatter : NSObjectProtocol
{
    func stringForValue(_ value: Double,
                        entry: GridItem,
                        indexPath: NSIndexPath) -> String
}
