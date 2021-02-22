//
//  ViewController.swift
//  ViewCode
//
//  Created by heider de oliveira Boaes on 25/01/21.
//

import UIKit

class HomeViewController: UIViewController, List{
    let viewModel = HomeScreenViewModel()
    
    
    func list(index: Int) {
        let listViewModel = ListViewModel()
        let product = viewModel.returnProduct(index: index)
        let outraTelaVC = ListViewController()
        outraTelaVC.products = product
            navigationController?.pushViewController(outraTelaVC, animated: true)

    }
    
    
    lazy var myView: HomeScreenView = {
            let view = HomeScreenView()
            view.delegate = self
            return view
        }()
    
    
//    private var myView: HomeScreenView{
//        //swiftlint:disable force_cast
//                return view as! HomeScreenView
//                //swiftlint:enable force_cast
//    }
    
    override func loadView() {
            //let myView = HomeScreenView()
            view = myView
        
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        viewModel.delegate = myView
        myView.viewModel = viewModel
        
    }

}

