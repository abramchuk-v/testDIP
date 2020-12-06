//
//  CoordinatorsAssembly.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Dip
import UIKit

let assemblyCordinators = [loginCoordinator,
                           detailsCoordinator]

// MARK: - Login Coordinator.

private let loginCoordinator = DependencyContainer() { container in
    
    // Login Factory
    //
    container.register(factory: { LoginModulesFactoryImp(with: container) as LoginModulesFactory })
    
    // Login Coordinator
    //
    container.register { (nav: UINavigationController) -> LoginCoordinator in
        
        try LoginCoordinatorImp(with: container.resolve(),
                                loginService: container.resolve(),
                                moduleFactory: container.resolve(),
                                navigator: container.resolve(arguments: nav))
    }
}


// MARK: - Details Coordinator.

private let detailsCoordinator = DependencyContainer() { container in
    
    // Details Factory
    //
    container.register(factory: { DetailsModuleFactoryImp(with: container) as DetailsModuleFactory })
    
    // Details Coordinator
    //
    container.register { (nav: NavigatorProtocol) -> DetailsCoordinator in
        
        try DetailsCoordinatorImp(with: container.resolve(),
                                  moduleFactory: container.resolve(),
                                  navigator: nav)
    }
}



