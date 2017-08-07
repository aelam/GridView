//
//  GridAdapter.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import UIKit

final class GridAdapter: NSObject, GridDataProvider {
    
    weak var gridView: GridView?
    weak var gridViewDelegate: GridViewDelegate?
    weak var gridViewDataSource: GridViewDataSource?
    
    var gridData: GridData?

    
}
