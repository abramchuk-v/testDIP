//
//  ServiceAssembly.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Dip
import UIKit

// MARK: - Login Service

final class ServiceAssembly: Assembly {
    func assemble(container: DependencyContainer) {
        container.register(.singleton, type: LoginServiceProtocol.self) { LoginService() }
    }
}
