//
//  CollectionCell.swift
//  ViewCode
//
//  Created by heider de oliveira Boaes on 26/01/21.
//

import UIKit


struct fonts{
    static let titlefont = UIFont.systemFont(ofSize: 14, weight: .semibold)
    
    
}
class CollectionCell: UICollectionViewCell{
    
    
    private lazy var productImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        }()
    
    private lazy var productLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = .lightGray
        label.textAlignment = .center
        label.font = fonts.titlefont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
    
    convenience init() {
        self.init(frame: .zero)

    }
    
    func setup(product: Products){
        productLabel.text = product.style
        productImageView.from(url: product.image)
        setupUI()
    }
    
    private func setupUI(){
        
        contentView.addSubview(productImageView)
        contentView.addSubview(productLabel)

        productImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 0).isActive = true
        productImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -30).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        productLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor).isActive = true
        productLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        productLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        productLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        
    }
   
}
