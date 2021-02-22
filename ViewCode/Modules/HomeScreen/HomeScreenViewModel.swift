//
//  HomeScreenViewModel.swift
//  ViewCode
//
//  Created by heider de oliveira Boaes on 10/02/21.
//

import Foundation

class HomeScreenViewModel{
    var products:[Products] = []
    
    weak var delegate: HomeScreenView?
    
    init() {
              getProducts()
    }
    
    func getProducts(){
        let styleService = StyleService()
        styleService.getStyle { [weak self] (result) in
        
            switch result {
            case .success(let products):
                self?.products = products
                self?.delegate?.reloadData()
            case .failure:
                print("No Products were returned")
            }
        }
        
    }
    
    func returnProduct(index: Int) -> Products{
        
        return products[index]
    }
    
}



