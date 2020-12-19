//
//  LoginViewModel.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Foundation

protocol LoginViewModelProtocol {
    func check(userName: String?, password: String?)
    
    var onLogin: (() -> Void)? { get set }
    
    var onError: (() -> Void)? { get set }
}

class LoginViewModel: LoginViewModelProtocol {
    
    var onLogin: (() -> Void)?
    var onError: (() -> Void)?
    
    private let loginService: LoginServiceProtocol
    
    init(loginService: LoginServiceProtocol) {
        self.loginService = loginService
    }
    
    func check(userName: String?, password: String?) {
        
        loginService.check(userName: userName, password: password) ? onLogin?() : onError?()
    }

}
