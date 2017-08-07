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
    
    func gridView(_ gridView: GridView, cellForItemAt indexPath: IndexPath) -> GridItemCell {
        return GridItemCell()
    }

    func frozenColumns(_ gridView: GridView) -> Int {
        return 2
    }

}

