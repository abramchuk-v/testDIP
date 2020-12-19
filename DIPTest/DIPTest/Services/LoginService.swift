//
//  LoginService.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Foundation

protocol LoginServiceProtocol: class {
    
    var isLoggedIn: Bool { get }
    
    func check(userName: String?, password: String?) -> Bool
    
    func logout()
}

class LoginService: LoginServiceProtocol {
    
    private(set) var isLoggedIn: Bool = false
    
    private let correctUser = "user"
    
    private let correctPassword = "123qwe"
    
    func check(userName: String?, password: String?) -> Bool {
        isLoggedIn = userName == correctUser && password == correctPassword
        
        return isLoggedIn
    }
    
    func logout() {
        isLoggedIn = false
    }
}
