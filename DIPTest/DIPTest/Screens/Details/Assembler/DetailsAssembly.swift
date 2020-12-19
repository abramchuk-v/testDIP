//
//  DetailsAssembly.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/19/20.
//

import Dip

final class DetailsAssembly: Assembly {
    func assemble(container: DependencyContainer) {
        // Details Factory
        //
        container.register(factory: { DetailsModuleFactoryImp(with: container) as DetailsModuleFactory })
        
        // Details Coordinator
        //
        container.register { (nav: NavigatorProtocol) -> DetailsCoordinator in
            
            try DetailsCoordinatorImp(with: container.resolve(),
                                      moduleFactory: container.resolve(),
                                      navigator: nav)
        }
        
        // View Model
        //
        container.register(factory: { DetailsViewModelImp(loginService: $0) as DetailsViewModel })
        
        // View
        //
        container.register(factory: { DetailsViewController(viewModel: $0) as DetailsViewable })
    }
}
