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
    public var itemSize = CGSize(width: 100, height: 40)
    
    private var headerCollectionViews = Set<UICollectionView>()
    
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
        
        headerView.collectionView.contentOffset = CGPoint(x: contentOffsetX, y: 0)
        headerView.collectionView.delegate = self

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
    
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        var item: GridItem?
        
        if let tableViewCell = collectionView.superview?.superview as? UITableViewCell {
            if let rowIndexPath = tableView.indexPath(for: tableViewCell) {
                if let gridRow = self.gridData?.dataSets?[rowIndexPath.section].rows?[rowIndexPath.row] {
                    item = gridRow.items?[indexPath.item]
                }
            }
            
        } else if let tableViewHeader = collectionView.superview?.superview as? UITableViewHeaderFooterView {
            
            let headers = tableView.visibleSectionHeaders()
            // TODO  cache 显示的header
            var index = -1
            
            for i in 0..<headers!.count {
                if tableViewHeader == headers![i] {
                    index = i
                    break
                }
            }
            
            if index > 0 {
                let gridRow = self.gridData?.dataSets?[index].section
                item = gridRow?.items?[indexPath.item]
            }
        }
        
        
        
        guard
            let cell = cell as? Bindable,
            let unwrappedItem = item else {
                return
        }

        cell.bindViewModel(unwrappedItem)
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.delegate?.gridView(self, widthForColumn: indexPath.item) ?? self.itemSize.width
        let height = self.delegate?.gridView(self, heightForRow: indexPath.section) ?? self.itemSize.height
            
        return CGSize(width: width, height: height)
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
    
    internal func isCollectionViewInHeaderView(_ collectionView: UICollectionView) -> Bool {
        
        if headerCollectionViews.contains(collectionView) {
            return true
        }

        var superview = collectionView.superview
        while superview != nil {
            if superview is UITableViewCell {
                return false
            } else if superview is UITableViewHeaderFooterView {
                headerCollectionViews.insert(collectionView)
                return true
            } else {
                superview = superview?.superview
            }
        }
        
        return false
    }

}


extension UITableView {
    func visibleSectionHeaders() -> [UITableViewHeaderFooterView]? {
        let numberOfSections = self.numberOfSections
        let visibleRect = self.bounds
        
        var headers = [UITableViewHeaderFooterView]()
        
        for i in 0..<numberOfSections {
            let sectionRect = self.rect(forSection: i)
            if visibleRect.intersects(sectionRect) {
                if let header = self.headerView(forSection: i) {
                    headers.append(header)
                }
            }
        }

        return headers
    }
}
