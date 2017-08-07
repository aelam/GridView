//
//  IndexPath-Grid.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import Foundation

//
public extension IndexPath {
    
    public init(section: Int, row: Int) {
        self.init()
        self.section = section
        self.row = row
    }

}


public extension IndexPath {
    public var column: Int {
        return section
    }
    
    public init(row: Int, column: Int) {
        self.init(row: row, section: column)
    }
}


public struct GridIndexPath {
    public var section: Int
    public var row: Int
    public var column: Int
    
    public init(section: Int, row: Int, column: Int) {
        self.section = section
        self.row = row
        self.column = column
    }
    
    public func indexPath() -> IndexPath {
        return IndexPath(section: self.section, row: self.row)
    }
    
    public func columnIndexPath() -> IndexPath {
        return IndexPath(row: self.row, column: self.column)
    }
    
}
