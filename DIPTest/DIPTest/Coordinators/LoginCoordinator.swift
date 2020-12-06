//
//  LoginCoordinator.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Foundation

protocol LoginCoordinator: Coordinator {
    
    var detailsCoord: DetailsCoordinator? { get set }
    
    func showLoginState()
    func showErrorState()
}

final class LoginCoordinatorImp: LoginCoordinator {
    
    var detailsCoord: DetailsCoordinator?
    
    private let coordinatorFactory: CoordinatorFactory
    private let loginService: LoginServiceProtocol
    private let moduleFactory: LoginModulesFactory
    private let navigator: NavigatorProtocol
    
    init(with coordinatorFactory: CoordinatorFactory,
                  loginService: LoginServiceProtocol,
                  moduleFactory: LoginModulesFactory,
                  navigator: NavigatorProtocol) {
        
        self.coordinatorFactory = coordinatorFactory
        self.loginService = loginService
        self.moduleFactory = moduleFactory
        self.navigator = navigator
    }
    
    func start() {
        showLoginState()
    }
    
    // MARK: - LoginCoordinator
    
    func showLoginState() {
        
        var module = moduleFactory.makeLogin()
        
        module.loginSuccesfull = { [weak self] in
            self?.showErrorState()
        }
        
        navigator.setRootModule(module)
    
    }
    
    func showErrorState() {
        
        let coord = coordinatorFactory.makeDetailsCoordinator(with: navigator)
        
        detailsCoord = coord
        
        detailsCoord?.start()
    }
}
