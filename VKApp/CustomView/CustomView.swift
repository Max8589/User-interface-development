///Users/admin/Documents/User interface development/VKApp/VKApp/VKApp
//  CustomView.swift
//  VKApp
//
//  Created by admin on 11/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

enum CellIdentifier: String {
    case defaultCell = "UITableViewCell"
    case groupsVKTableViewCell = "GroupsVKTableViewCell"
}

class CustomView: UIView {

    public func reload(viewModels: [BaseViewModel]) {
        self.viewModels = viewModels
        self.tableView?.reloadData()
        self.collectionView?.reloadData()
    }
    
    public func setHeader(viewModel: VKAppHeaderViewModel) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        label.text = viewModel.groupName
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        self.tableView?.tableHeaderView = label
    }
    
    // MARK: -
    
    private var viewModels: [BaseViewModel] = []
    
    private weak var tableView: UITableView?
    
    private weak var collectionView: UICollectionView?

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.customInit()
    }
    
    private func customInit() {
        self.addSubviews()
    }
    
    // MARK: - Subview
    
    func addSubviews() {
        self.addTableView()
        self.addCollectionView()
    }
    
    func addCollectionView() {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        
        
        self.addSubviews(collectionView)
        self.collectionView = collectionView
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    func addTableView() {
        let tableView = UITableView()
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        self.addSubview(tableView)
        self.tableView = tableView
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.defaultCell.rawValue)
        
        let groupsVKAppNib = UINib(nibName: "GroupsVKTableViewCell", bundle: nil)
        tableView.register(groupsVKAppNib, forCellReuseIdentifier: CellIdentifier.groupsVKTableViewCell.rawValue)

    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.tableView?.frame = self.bounds
        self.collectionView?.frame = self.bounds
    }
}


extension CustomView: UICollectionViewDelegate {
    
    
}

extension CustomView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let defaultcell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        
        return defaultcell
    }
    
    
    
}


    extension CustomView: UITableViewDelegate {
        
    }
    
    extension CustomView: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.viewModels.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if let groupsVKTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.groupsVKTableViewCell.rawValue, for: indexPath) as? GroupsVKTableViewCell{
            
               if let viewModel = self.viewModels[indexPath.row] as? VKApplicationViewModel {
                    groupsVKTableViewCell.setViewModel(viewModel: viewModel)
                }
                return groupsVKTableViewCell
            
            } else {
                
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.defaultCell.rawValue, for: indexPath)

            defaultCell.textLabel?.text = "\(indexPath)"
            return defaultCell
        }
   }
}
