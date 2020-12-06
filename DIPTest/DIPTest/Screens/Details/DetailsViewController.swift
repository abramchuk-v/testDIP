//
//  DetailsViewController.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import UIKit

protocol DetailsViewable: Presentable {
    
    var someHandler: (() -> Void)? { get set }
    
    init(viewModel: DetailsViewModel)
}

class DetailsViewController: UIViewController, DetailsViewable {
    
    var someHandler: (() -> Void)?
    
    private let viewModel: DetailsViewModel
    
    required init(viewModel: DetailsViewModel) {
        
        self.viewModel = viewModel
        
        super.init(nibName: Self.identifier, bundle: nil)
        
        title = "DETAILS"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
