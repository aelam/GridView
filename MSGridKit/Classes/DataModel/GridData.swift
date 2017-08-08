//
//  MSGridData.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import Foundation

public class GridData: NSObject {
    
    var dataSets: [GridDataSet]?

    public init(_ dataSets: [GridDataSet]?) {
        super.init()
        self.dataSets = dataSets
    }
    
}
