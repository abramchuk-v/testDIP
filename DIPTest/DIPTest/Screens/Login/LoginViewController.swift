//
//  LoginViewController.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import UIKit

protocol LoginViewable: Presentable {
    
    init(viewModel: LoginViewModelProtocol)
    
    var loginSuccesfull: (() -> Void)? { get set }
}

class LoginViewController: UIViewController, LoginViewable {
    
    var loginSuccesfull: (() -> Void)?
  
    private let viewModel: LoginViewModelProtocol
    
    required init(viewModel: LoginViewModelProtocol) {
        
        self.viewModel = viewModel
        
        super.init(nibName: Self.identifier, bundle: nil)
        
        title = "Login"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func testAction(_ sender: Any) {
        loginSuccesfull?()
    }
}

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
}
