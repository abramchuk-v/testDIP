//
//  CoordinatorFactory.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Dip

protocol CoordinatorFactory {
    
    func makeDetailsCoordinator(with navigator: NavigatorProtocol) -> DetailsCoordinator
    
}

final class CoordinatorFactoryImp: CoordinatorFactory {
    
    private let container: DependencyContainer
    
    init(with container: DependencyContainer) {
        self.container = container
    }
    
    func makeDetailsCoordinator(with navigator: NavigatorProtocol) -> DetailsCoordinator {
        
        guard let coord: DetailsCoordinator = try? container.resolve(arguments: navigator) else { fatalError() }
        
        return coord
    }
}
