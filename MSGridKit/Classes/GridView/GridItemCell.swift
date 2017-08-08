//
//  GridItemCell.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import UIKit


open class GridItemCell: UICollectionViewCell, Bindable {
    
    public var textLabel: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.red.cgColor
        
        setUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderWidth = 1
        setUp()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
    }
    
    func setUp() {
        self.textLabel = UILabel(frame: self.bounds)
        self.textLabel.textAlignment = .center
        self.addSubview(self.textLabel)
        self.textLabel.text = "Hello"
    }
    
    public func bindViewModel(_ viewModel: Any) {
        if let data = viewModel as? Double {
            self.textLabel.text = "\(data)"
        } else if let data = viewModel as? Int {
            self.textLabel.text = "\(data)"
        } else if let data = viewModel as? GridItem {
            self.textLabel.text = "\(data.value)"
        }

    }
    

}
