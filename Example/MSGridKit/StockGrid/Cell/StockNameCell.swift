//
//  StockNameCell.swift
//  MSGridKit
//
//  Created by Ryan Wang on 08/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import MSGridKit
import SnapKit

public class StockNameCell: UICollectionViewCell, Bindable {
    public var stockNameLabel: UILabel!
    public var stockCodeLabel: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.stockNameLabel = UILabel()
        self.stockNameLabel.textAlignment = .center
        self.contentView.addSubview(self.stockNameLabel)
        
        self.stockCodeLabel = UILabel()
        self.contentView.addSubview(self.stockCodeLabel)
        self.stockNameLabel!.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(20)
            make.left.right.top.equalTo(0)
        }
        self.stockCodeLabel!.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(20)
            make.left.right.bottom.equalTo(0)
        }

    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func bindViewModel(_ viewModel: Any) {
        if let item = viewModel as? StockNameItem {
            self.stockCodeLabel.text = item.stockCode
            self.stockNameLabel.text = item.stockName
        }
    }
}
