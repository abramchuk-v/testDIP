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
        
        container.collaborate(with: assemblyServices)
        container.collaborate(with: assemblyCordinators)
        container.collaborate(with: assemblyModules)
        
        // Coordinator Factory
        //
        container.register(factory: { CoordinatorFactoryImp(with: container) as CoordinatorFactory })
        
        // Navigator
        //
        container.register { (navigationControl: UINavigationController) -> NavigatorProtocol in
            Navigator(rootController: navigationControl)
        }
        
        return container
    }()
    
    private var mainCoordinator: LoginCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = scene as? UIWindowScene else { return }
            
        window = UIWindow(windowScene: windowScene)
        let rootVC = UINavigationController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
        guard let coord: LoginCoordinator = try? container.resolve(arguments: rootVC) else { fatalError("") }
        
        // For saving reference
        //
        mainCoordinator = coord
        
        coord.start()
        
    }

}

