//
//  HomeScreenView.swift
//  ViewCode
//
//  Created by heider de oliveira Boaes on 10/02/21.
//

import UIKit

protocol List:class {
    func list(index: Int)
}


class HomeScreenView: UIView{
    
    weak var delegate: List?
  
    private let productCell = "Product Cell"
    var viewModel = HomeScreenViewModel()
    
    private lazy var collectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var search: UISearchBar = {
        var search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.barStyle = .black
        search.barTintColor = .yellow
        return search
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func reloadData(){
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCell, for: indexPath) as? CollectionCell
        cell?.backgroundColor = .white
        cell?.layer.borderWidth = 1
        cell?.setup(product: viewModel.products[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.list(index: indexPath.row)
        
        
        
//        print(indexPath.row)
//   let vc = HomeViewController()
//       let uv = PromotionPageViewController()
//        vc.navigationController?.pushViewController(uv, animated: true)
    
    
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}

extension HomeScreenView: ViewCodable, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func setupHierarchy() {
        self.addSubview(collectionView)
        self.addSubview(search)
    }
    
    func setupConstraints() {
        
        collectionView.topAnchor.constraint(equalTo: search.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
        
        search.topAnchor.constraint(equalTo: self.topAnchor,constant: 50).isActive = true
        search.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        search.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        search.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -5).isActive = true
    }
    
    func setupAcessibilityIdentifiers() {
        
    }
    
    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier:productCell )
    }
}
