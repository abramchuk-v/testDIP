//
//  SceneDelegate.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import UIKit
import Dip

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private let container: DependencyContainer =  {
        let container = DependencyContainer()
    
        container.addAssemblers(assemblers: [ServiceAssembly(),
                                             LoginAssembly(),
                                             DetailsAssembly()])
        
        container.register(factory: { CoordinatorFactoryImp(with: container) as CoordinatorFactory })
        
        container.register(factory: { Navigator(rootController: UINavigationController()) as NavigatorProtocol })
        
        return container
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }
            
        guard
            let navigator: NavigatorProtocol = try? container.resolve(),
            let coord: LoginCoordinator = try? container.resolve(arguments: navigator) else { fatalError("") }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigator.toPresent()
        window?.makeKeyAndVisible()
        
        coord.start()
        
    }

}

