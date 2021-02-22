//
//  ListViewController.swift
//  ViewCode
//
//  Created by Raened Pereira on 17/02/21.
//

import UIKit

class ListViewController: UIViewController {
    let viewModel = ListViewModel()
    var products: Products?
    
    
    // MARK: Properties
    
    private var myView: ListView {
        return view as! ListView
    }
    
    override func loadView() {
        let myView = ListView()
        self.view = myView
       
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        self.title = "Viewcode"
        viewModel.delegate = myView
        myView.viewModel = viewModel
        guard let product = products else {return}

    }
}
