//
//  GridViewRowCell.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import UIKit

public class GridViewRowCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    public var gridRow: GridRow?
    
    public private(set) var collectionView: UICollectionView!
    
//    private var registeredCellClasses = [String, AnyClass]()
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setUp() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 30, height: 30)
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        self.contentView.addSubview(collectionView!)
        collectionView.dataSource = self
        collectionView!.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        collectionView.register(GridItemCell.self, forCellWithReuseIdentifier: NSStringFromClass(GridItemCell.self))
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
