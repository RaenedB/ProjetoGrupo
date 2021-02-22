//
//  ProductViewCell.swift
//  ViewCode
//
//  Created by Raened Pereira on 17/02/21.
//

import UIKit

struct Fonts {
    static let titleFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
    static let descriptionFont = UIFont.systemFont(ofSize: 14, weight: .regular)
   static  let priceFont = UIFont.systemFont(ofSize: 12, weight: .bold)
}

class ProductViewCell: UITableViewCell {
    var count = 0

    
    private lazy var productImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.titleFont
        return label
        
    }()
    private lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.descriptionFont
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.priceFont
        label.textAlignment = .right
        return label
    }()
    
    private lazy var volumeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.priceFont
        label.textAlignment = .right
        label.textColor = .lightGray
        return label
    }()

    private lazy var stackView: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [titleLabel,priceLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()
    private lazy var addItemsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage.addIcon, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.isEnabled = true
        button.addTarget(self, action: #selector(ProductViewCell.addItems(sender:)), for: .touchUpInside)
        return button
    }()

    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = String(count)
        label.textAlignment = .center
        label.widthAnchor.constraint(equalToConstant: 40).isActive = true
        label.layer.borderColor = UIColor.systemGray4.cgColor
        label.layer.cornerRadius = 5
        label.layer.borderWidth = 0.5
        return label
    }()

    private lazy var removeItemsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage.removeIcon, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.addTarget(self, action: #selector(ProductViewCell.removeItems), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    private lazy var stackViewButtons: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [addItemsButton,quantityLabel,removeItemsButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()


  
        
    convenience init() {
        self.init(frame: .zero)
    }
    
    func configure(product: Beer) {
        
        titleLabel.text = product.name
        priceLabel.text = String(product.price)
        if product.discount {
            priceLabel.textColor = .green

        } else {
            priceLabel.textColor = .black
        }
        
        descriptionLabel.text = product.description
        volumeLabel.text = product.volume

        setupUI()
      
            
    }
    
    private func setupUI(){
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.yellow.cgColor
        layer.cornerRadius = 8 //canto arredondado
        clipsToBounds = true
        
        addSubview(productImageView)
        addSubview(descriptionLabel)
        addSubview(priceLabel)
        addSubview(titleLabel)
        addSubview(volumeLabel)
        //addSubview(stackViewButtons)
        
        // criar as constraints aqui
        productImageView
            .widthTo(50)
            .heightTo(50)
            .leadingToSuperview(16)
            .topToSuperview(16)

        productImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16).isActive = true
//        productImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        productImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
//        productImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
//        productImageView.bottomAnchor.constraint(lessThanOrEqualTo:bottomAnchor, constant: -16).isActive = true
        titleLabel
            .leadingToTrailing(of: productImageView, margin: 8)
            .topToTop(of: productImageView)
            .trailingToSuperview(16)
        
        priceLabel
            .trailingToSuperview(16, priority: .required)
            .centerVerticalToSuperView()


    
        
//        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
//        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
//        descriptionLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -16).isActive = true
//        descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -8).isActive = true
        descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16).isActive = true

        
        volumeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8).isActive = true
        volumeLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: 16).isActive = true
        volumeLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8).isActive = true
        
        
        stackViewButtons.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 16).isActive = true
        stackViewButtons.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackViewButtons.trailingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor, constant: -16).isActive = true
        
//        stackViewButtons.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 8).isActive = true
//        stackViewButtons.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
//        stackViewButtons.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
//
        
    }
    func getValue() -> String {
        return String(count)
    }
    
    @objc func addItems(sender: UIButton){
        removeItemsButton.isEnabled = true
        count = count + 1
        quantityLabel.text = String(count)
        getValue()
    }
    
    @objc func removeItems() {
        count = count - 1
        if count == 0 {
            removeItemsButton.isEnabled = false
            count = 0
        } else {
            removeItemsButton.isEnabled = true
        }
        getValue()
        quantityLabel.text = String(count)
    }
    
}
    
        


