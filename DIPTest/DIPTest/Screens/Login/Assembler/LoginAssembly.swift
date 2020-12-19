//
//  LoginAssembly.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/19/20.
//

import Dip

final class LoginAssembly: Assembly {
    func assemble(container: DependencyContainer) {
        // Login Factory
        //
        container.register(factory: { LoginModulesFactoryImp(with: container) as LoginModulesFactory })
        
        // Login Coordinator
        //
        container.register(.singleton) { (nav: NavigatorProtocol) -> LoginCoordinator in
            
            try LoginCoordinatorImp(with: container.resolve(),
                                    loginService: container.resolve(),
                                    moduleFactory: container.resolve(),
                                    navigator: nav)
        }
        
        // View Model
        //
        container.register(factory: { LoginViewModel(loginService: $0) as LoginViewModelProtocol })
        
        // View
        //
        container.register(factory: { LoginViewController(viewModel: $0) as LoginViewable })
    }
}
