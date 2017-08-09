//
//  GridViewRowHeader.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import UIKit

open class GridViewRowHeaderView: UITableViewHeaderFooterView, UICollectionViewDataSource {
    
    open var gridRow: GridSection? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    var collectionView: UICollectionView!
   
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    func setUp() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 30, height: 30)
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.contentView.addSubview(collectionView!)
        collectionView.register(GridItemCell.self, forCellWithReuseIdentifier: NSStringFromClass(GridItemCell.self))
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gridRow?.items?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(GridItemCell.self), for: indexPath)
    }
    
    
    
    
}
