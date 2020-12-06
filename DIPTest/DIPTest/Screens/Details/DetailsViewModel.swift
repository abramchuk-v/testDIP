//
//  DetailsViewModel.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Foundation

protocol DetailsViewModel {

    func showSomething()
}

final class DetailsViewModelImp: DetailsViewModel {
    
    private let loginService: LoginServiceProtocol
    
    init(loginService: LoginServiceProtocol) {
        self.loginService = loginService
    }
    
    func showSomething() {
        
    }
}
