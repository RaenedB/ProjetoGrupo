//
//  PromotionPageViewController.swift
//  ViewCode
//
//  Created by heider de oliveira Boaes on 11/02/21.
//

import UIKit

class PromotionPageViewController: UIViewController {
    
    var product:Products?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        if let produto = product{
            print(produto.style)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
