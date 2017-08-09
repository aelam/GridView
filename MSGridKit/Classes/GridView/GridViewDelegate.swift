//
//  GridViewDelegate.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import Foundation

public protocol GridViewDelegate: class {
    func gridView(_ gridView: GridView, widthForColumn column: Int) -> CGFloat
    func gridView(_ gridView: GridView, heightForRow row: Int) -> CGFloat
    func gridView(_ gridView: GridView, heightForSection section: Int) -> CGFloat
    func frozenColumns(_ gridView: GridView) -> Int
    
    
    func gridView(_ gridView: GridView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) // IndexPath{section, row}
    
    func gridView(_ gridView: GridView, willDisplayHeaderView view: UIView, forSection section: Int)
    
    func gridView(_ gridView: GridView, willDisplay itemCell: UICollectionViewCell, forSection section: Int, indexPath: IndexPath)  // IndexPath{row, item}

    

}


