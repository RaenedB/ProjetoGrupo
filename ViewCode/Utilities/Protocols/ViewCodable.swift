//
//  ViewCodable.swift
//  ViewCode
//
//  Created by heider de oliveira Boaes on 10/02/21.
//

import Foundation
import UIKit

protocol ViewCodable {
    /// This method builds the view using all the other methods fom the protocol
    func setupView()
    
    /// Use to setup delegates and things like delegates, texts, and images
    func configure()
    
    /// Use to add any UI components inside the view
    func setupHierarchy()
    
    /// Add constraints to the view and the subviews
    func setupConstraints()

    /// Setup any acessibility to the view
    func setupAcessibilityIdentifiers()
}

extension ViewCodable {
    
    func setupView() {
        configure()
        setupHierarchy()
        setupConstraints()
        setupAcessibilityIdentifiers()
    }
    
    // Cells for example will use configureCell()
    func configure () { }
}
