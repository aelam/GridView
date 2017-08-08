//
//  GridValue.swift
//  MSGridKit
//
//  Created by ryan on 08/08/2017.
//

import UIKit

public protocol GridValue: class {
    var data: AnyObject? { get }
}

public class SimpleGridValue: NSObject, GridValue {
    public var data: AnyObject?
}


public protocol Bindable: NSObjectProtocol {
    func bindViewModel(_ viewModel: Any)
}

extension UICollectionViewCell: Bindable {
    public func bindViewModel(_ viewModel: Any) {
        
    }

}
