//
//  LoginModulesFactory.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Dip
protocol LoginModulesFactory {
    
    func makeLogin() -> LoginViewable
    
}

struct LoginModulesFactoryImp {
    
    private let container: DependencyContainer
    
    init(with container: DependencyContainer) {
        self.container = container
    }
}

// MARK: - LoginModulesFactory

extension LoginModulesFactoryImp: LoginModulesFactory {
    
    func makeLogin() -> LoginViewable {
        
        guard let vc: LoginViewable = try? container.resolve() else { fatalError() }
        
        return vc
    }
}
