//
//  ViewController.swift
//  MSGridKit
//
//  Created by aelam on 08/07/2017.
//  Copyright (c) 2017 aelam. All rights reserved.
//

import UIKit
import MSGridKit

class ViewController: UIViewController, GridViewDelegate, GridViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gridView = GridView(frame: self.view.bounds)
        self.view.addSubview(gridView)
        gridView.delegate = self
        gridView.dataSource = self
        
        let gridData = buildData()
        
        gridView.gridData = gridData
    }
    
    
    func buildData() -> GridData {
        
        let gridSection = GridSection([1,2,3,4,5,6, 1,2,3,4,5,6, 1,2,3,4,5,6])
        var gridRows = [GridRow]()
        
        for _ in 0..<50 {
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
    
    func numberOfSections(in gridView: GridView) -> Int {
        return 1
    }
    
    func gridView(_ gridView: GridView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func numberOfColumns(_ gridView: GridView) -> Int {
        return 20
    }
    
    func gridView(_ gridView: GridView, cellForItemAt section: Int, indexPath: IndexPath) -> GridItemCell {
        print(section, indexPath)
        return GridItemCell()
        //gridView.dequeueReusableCell(withIdentifier: NSStringFromClass(GridItemCell.self), for: section, indexPath: indexPath)
    }

    func frozenColumns(_ gridView: GridView) -> Int {
        return 2
    }

}

