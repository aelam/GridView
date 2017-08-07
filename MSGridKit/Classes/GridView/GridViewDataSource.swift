//
//  GridViewDataSource.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import Foundation

public protocol GridViewDataSource: class {
    func gridView(_ gridView: GridView, numberOfRowsInSection section: Int) -> Int
    func numberOfSections(in gridView: GridView) -> Int
    func numberOfColumns(_ gridView: GridView) -> Int
    func gridView(_ gridView: GridView, cellForItemAt indexPath: IndexPath) -> GridItemCell
}


extension GridViewDataSource {
    func gridView(_ gridView: GridView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in gridView: GridView) -> Int {
        return 1
    }
    
    func numberOfColumns(_ gridView: GridView) -> Int {
        return 0
    }
    
    func gridView(_ gridView: GridView, cellForItemAt indexPath: IndexPath) -> GridItemCell {
        return GridItemCell()
    }

}
