//
//  MSGridItemData.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import Foundation

//open protocol GridItemData {
//    
//}

open class GridItem: NSObject {
    var value: Any
    var data: AnyObject?
    
    public init(_ value: Any) {
        self.value = value
        super.init()
    }
}


open class ComplexGridItem: GridItem {

    public var cellClass: AnyClass = ComplexGridItemCell.self
    public var cellNibName: String?
    public var cellNibBundle: Bundle?
}

public protocol GridValue: class {
    var data: AnyObject? { get }
}

public class SimpleGridValue: NSObject, GridValue {
    public var data: AnyObject?
}


public protocol Bindable: NSObjectProtocol {
    func bindViewModel(_ viewModel: Any)
}

public class ComplexGridItemCell: UICollectionViewCell, Bindable {
    public func bindViewModel(_ viewModel: Any) {
        
    }
}
