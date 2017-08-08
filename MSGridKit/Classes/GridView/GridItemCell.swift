//
//  GridItemCell.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import UIKit


open class GridItemCell: UICollectionViewCell {
    
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
        self.textLabel = UILabel.init(frame: self.bounds)
        self.addSubview(self.textLabel)
        self.textLabel.text = "Hello"
    }
    
    

}
