//
//  DetailsCoordinator.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Foundation

protocol DetailsCoordinator: Coordinator {
    
    func showDetailsState()
}

final class DetailsCoordinatorImp {
    
    private let coordinatorFactory: CoordinatorFactory
    private let moduleFactory: DetailsModuleFactory
    private let navigator: NavigatorProtocol
    
    init(with coordinatorFactory: CoordinatorFactory,
         moduleFactory: DetailsModuleFactory,
         navigator: NavigatorProtocol) {
        
        self.coordinatorFactory = coordinatorFactory
        self.moduleFactory = moduleFactory
        self.navigator = navigator
    }
    
    func start() {
        showDetailsState()
    }
    
}

// MARK: - DetailsCoordinator

extension DetailsCoordinatorImp: DetailsCoordinator {
    
    func showDetailsState() {
        
        var module = moduleFactory.makeDetails()
        
        module.someHandler = { }
        
        navigator.push(module)
    }
}
