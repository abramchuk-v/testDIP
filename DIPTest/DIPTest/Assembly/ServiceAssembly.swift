//
//  ServiceAssembly.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Dip
import UIKit

let assemblyServices = [loginService]

// MARK: - Login Service

private let loginService = DependencyContainer() { container in
    container.register(.singleton, type: LoginServiceProtocol.self) { LoginService() }
}
