//
//  DetailsModuleFactory.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import Dip

protocol DetailsModuleFactory {
    
    func makeDetails() -> DetailsViewable
}

struct DetailsModuleFactoryImp {
    
    private let container: DependencyContainer
    
    init(with container: DependencyContainer) {
        self.container = container
    }
    
}

// MARK: DetailsModuleFactory

extension DetailsModuleFactoryImp: DetailsModuleFactory {
    
    func makeDetails() -> DetailsViewable {
        
        guard let vm: DetailsViewable = try? container.resolve() else { fatalError() }
        
        return vm
    }
}
