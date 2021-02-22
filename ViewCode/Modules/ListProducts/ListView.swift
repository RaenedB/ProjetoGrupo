//
//  ListView.swift
//  ViewCode
//
//  Created by Raened Pereira on 17/02/21.
//

import UIKit

class ListView: UIView {

    // MARK: - Properties
    
    var viewModel: ListViewModel?
    private let productCell = "productCell"
    
    //MARK: - UI Elements

      lazy var productsTableView: UITableView = {
       var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(ProductViewCell.self, forCellReuseIdentifier: "productCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight =  100
        return tableView
    }()
    
    //MARK: -Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Delegate
    
    func reloadData() {
        productsTableView.reloadData()
    }
    
}
//MARK: - table view

// MARK: - UITableViewDelegate
extension ListView:  UITableViewDelegate {
  
}

// MARK: -UITableViewDataSource
extension ListView:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0}
        return viewModel.beers.count
        
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let viewModel = viewModel else {
            return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: productCell, for: indexPath) as? ProductViewCell else {return UITableViewCell() }
        
        cell.configure(product: viewModel.beers[indexPath.row])
        return cell
        
    }
    
}

// MARK: - Setups

extension ListView: ViewCodable {
    func setupHierarchy() {
        addSubview(productsTableView)
    }
    
    func setupConstraints() {
        // posicao X - SUPERIOR
        productsTableView.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        // POSICAO Y - INFERIOR
        productsTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        // POSICAO ESQUERDA
        productsTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        // POSICAO DIREITA
        productsTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func setupAcessibilityIdentifiers() {
        // no tests at the moment
    }
    
    
}
 
