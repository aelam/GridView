//
//  GridViewRowCell.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import UIKit

public class GridViewRowCell: UITableViewCell {

    public private(set) var collectionView: UICollectionView?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        self.contentView.addSubview(collectionView!)
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
