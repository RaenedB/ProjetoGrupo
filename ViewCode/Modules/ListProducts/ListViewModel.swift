//
//  ListViewModel.swift
//  ViewCode
//
//  Created by Raened Pereira on 17/02/21.
//

import Foundation
import UIKit

class ListViewModel {
    
    // MARK: - Properties
    var style: String?
    var products: [Products] = []
    var beers: [Beer] = []
    weak var delegate: ListView?
    
    // MARK: - Init
    init() {
        if let produto = style {
            getProducts(name: produto)
        }
    }
    
    // MARK: - Get Products
    
    private func getProducts(name: String) {
        BrandService().getBrand(name) { [weak self] (result) in
            guard let self = self else { return }
         
            switch result {
            case .success(let beers):
                self.beers = beers
                self.delegate?.reloadData()
            case .failure:
                print("No Products ")
            }
        }
    }
}

