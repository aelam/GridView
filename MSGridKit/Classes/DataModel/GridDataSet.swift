//
//  MSGridDataSet.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import Foundation

public class GridDataSet: NSObject {
    var section: GridSection?
    var rows: [GridRow]?
    
    subscript(row: Int, column: Int) -> GridItem? {
        guard let rows = rows else {
            return nil
        }
        
        guard rows.count <= row else {
            return nil
        }
        
        return rows[row][column]
    }
    
}
