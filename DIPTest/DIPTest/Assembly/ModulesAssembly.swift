//
//  ModulesAssembly.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Dip

let assemblyModules = [loginModule,
                       detailsModule]

// MARK: - Login Module.

private let loginModule = DependencyContainer() { container in
   
    // View Model
    //
    container.register(factory: { LoginViewModel(loginService: $0) as LoginViewModelProtocol })
    
    // View
    //
    container.register(factory: { LoginViewController(viewModel: $0) as LoginViewable })
}

// MARK: - Details Module.

private let detailsModule = DependencyContainer() { container in
   
    // View Model
    //
    container.register(factory: { DetailsViewModelImp(loginService: $0) as DetailsViewModel })
    
    // View
    //
    container.register(factory: { DetailsViewController(viewModel: $0) as DetailsViewable })
    
}
