//
//  GridView.swift
//  Pods
//
//  Created by ryan on 07/08/2017.
//
//

import UIKit


open class GridView: UIView, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource {

    private var _columnCount = 0
    
    private let GridViewRowHeaderIdentifier = "GridViewRowHeader"
    private let GridViewRowCellIdentifier = "GridViewRowCell"
    open private(set) var tableView: UITableView!
    
    open var delegate: GridViewDelegate?
    open var dataSource: GridViewDataSource? {
        didSet {
            _columnCount = self.dataSource?.numberOfColumns(self) ?? 0
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    func setUp() {
        self.tableView = UITableView.init(frame: self.bounds)
        self.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(GridViewRowHeaderView.classForCoder(), forHeaderFooterViewReuseIdentifier: GridViewRowHeaderIdentifier)
        self.tableView.register(GridViewRowCell.classForCoder(), forCellReuseIdentifier: GridViewRowCellIdentifier)
    }
    
    
    //MARK: - - UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource?.numberOfColumns(self) ?? 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.gridView(self, numberOfRowsInSection: section) ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: GridViewRowCellIdentifier, for: indexPath) as! GridViewRowCell
        cell.collectionView!.dataSource = self
        return cell
    }
    
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: GridViewRowHeaderView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: GridViewRowHeaderIdentifier) as! GridViewRowHeaderView
        headerView.collectionView.dataSource = self
        return headerView
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _columnCount
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let tableViewCell = collectionView.superview as? UITableViewCell {
            let indexPath = tableView.indexPath(for: tableViewCell)
//            return self.dataSource?.gridView(self, cellForItemAt: indexPath) ??
                return GridItemCell()
        }
        
        return GridItemCell()
    }
}
