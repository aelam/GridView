//
//  GridView.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import UIKit


open class GridView: UIView, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    struct CacheValue {
        var columnCount = 0
        var numberOfSections = 1
    }
    
    private var _cacheValue = CacheValue()
    
    open private(set) var tableView: UITableView!

    open var delegate: GridViewDelegate?
    open var dataSource: GridViewDataSource? {
        didSet {
            _cacheValue.columnCount = self.dataSource?.numberOfColumns(self) ?? 0
            _cacheValue.numberOfSections = self.dataSource?.numberOfSections(in: self) ?? 1
        }
    }
    
    public var gridData: GridData?
    private var contentOffsetX: CGFloat = 0;
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    func setUp() {
        
        self.tableView = UITableView(frame: self.bounds)
        self.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        registerDefaultCells()
    }
    
    func registerDefaultCells() {
        self.tableView.register(GridViewRowHeaderView.self, forHeaderFooterViewReuseIdentifier: NSStringFromClass(GridViewRowHeaderView.self))
        self.tableView.register(GridViewRowCell.self, forCellReuseIdentifier: NSStringFromClass(GridViewRowCell.self))
    }
    
    //MARK: - - UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.gridData?.dataSets?.count ?? 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gridData!.dataSets![section].rows?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(GridViewRowCell.self), for: indexPath) as! GridViewRowCell
        cell.gridRow = self.gridData?.dataSets?[indexPath.section].rows?[indexPath.row] 
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.delegate?.gridView(self, heightForSection: section) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: GridViewRowHeaderView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: NSStringFromClass(GridViewRowHeaderView.self)) as! GridViewRowHeaderView
        headerView.gridRow = self.gridData?.dataSets?[section].section
        return headerView
    }

    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! GridViewRowCell
        cell.collectionView.contentOffset = CGPoint(x: contentOffsetX, y: 0)
        cell.collectionView.delegate = self
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let cell = view as! GridViewRowHeaderView
        cell.collectionView.contentOffset = CGPoint(x: contentOffsetX, y: 0)
        cell.collectionView.delegate = self
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView is UICollectionView {
            contentOffsetX = scrollView.contentOffset.x
            scrollCells()
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 40)
    }
    
    func scrollCells() {
    
        let numberOfSections = tableView.numberOfSections
        let visibleRect = self.tableView.bounds;
        for i in 0..<numberOfSections {
            let sectionRect = tableView.rect(forSection: i)
            if visibleRect.intersects(sectionRect) {
                let header = tableView.headerView(forSection: i) as! GridViewRowHeaderView
                header.collectionView.contentOffset = CGPoint(x: contentOffsetX, y: 0)
            }
        }
        
        for cell in self.tableView.visibleCells {
            if let cell = cell as? GridViewRowCell {
                cell.collectionView.contentOffset = CGPoint(x: contentOffsetX, y: 0)
            }
        }
    }

}
