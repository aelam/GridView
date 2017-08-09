//
//  ViewController.swift
//  MSGridKit
//
//  Created by aelam on 08/07/2017.
//  Copyright (c) 2017 aelam. All rights reserved.
//

import UIKit
import MSGridKit

class ViewController: UIViewController, GridViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gridView = GridView(frame: self.view.bounds)
        self.view.addSubview(gridView)
        gridView.delegate = self
        
        let gridData = buildData()
        
        gridView.gridData = gridData
    }
    
    
    func buildData() -> GridData {
        
        let gridSection = GridSection([1,2,3,4,5,6, 1,2,3,4,5,6, 1,2,3,4,5,6])
        var gridRows = [GridRow]()
        
        for _ in 0..<1 {
            gridRows.append(GridRow([1,2,3,4,5,6, 1,2,3,4,5,6, 1,2,3,4,5,6]))
        }
        
        let gridDataSet = GridDataSet(gridSection, gridRows)
        let gridData = GridData([gridDataSet])

        return gridData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gridView(_ gridView: GridView, heightForRow row: Int) -> CGFloat {
        return 44
    }
    
    func gridView(_ gridView: GridView, heightForSection section: Int) -> CGFloat {
        return 66
    }
    
    func gridView(_ gridView: GridView, widthForColumn column: Int) -> CGFloat {
        return 100
    }

    func gridView(_ gridView: GridView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) // IndexPath{section, row} 
    {
        
    }
    
    
    func gridView(_ gridView: GridView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
    }
    
    func gridView(_ gridView: GridView, willDisplay itemCell: UICollectionViewCell, forSection section: Int, indexPath: IndexPath)  // IndexPath{row, item} 
    {
        
    }
    
    
    

    
    

    func frozenColumns(_ gridView: GridView) -> Int {
        return 2
    }

}

