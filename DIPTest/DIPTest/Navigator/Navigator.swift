//
//  Navigator.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/6/20.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}

protocol NavigatorProtocol {
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    
    func push(_ module: Presentable?)
    
    func popModule()
    
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func setRootModule(_ module: Presentable?)
    
    func popToRootModule(animated: Bool)
    func popToModule(module: Presentable?, animated: Bool)
}


final class Navigator: NSObject, NavigatorProtocol, Presentable {
    
    private weak var rootController: UINavigationController?
    private var completions: [UIViewController : () -> Void]
    private var transition: UIViewControllerAnimatedTransitioning?
    
    func toPresent() -> UIViewController? { rootController }
    
    // MARK: - RouterProtocol
    
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        
        guard let controller = module?.toPresent() else { return }
        
        rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?)  {
        
        push(module, transition: nil, animated: true, completion: nil)
    }
    
    private func push(_ module: Presentable?, transition: UIViewControllerAnimatedTransitioning?, animated: Bool, completion: (() -> Void)?) {
        self.transition = transition
        
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
            else { fatalError("Deprecated push")}
        
            completions[controller] = completion
        
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popModule()  {
        popModule(transition: nil, animated: true)
    }
        
    private func popModule(transition: UIViewControllerAnimatedTransitioning?, animated: Bool) {
        self.transition = transition
        
        if let controller = rootController?.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    func popToModule(module: Presentable?, animated: Bool) {
        
        guard
            let controllers = rootController?.viewControllers,
            let module = module,
            let control = controllers.first(where: { $0 == module as? UIViewController })
        else { return }
        
        rootController?.popToViewController(control, animated: animated)
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func setRootModule(_ module: Presentable?) {
        setRootModule(module, hideBar: false)
    }
    
    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        
        rootController?.viewControllers = [controller]
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        if let controllers = self.rootController?.popToRootViewController(animated: animated) {
            controllers.forEach(runCompletion(for:))
        }
    }
    
    // MARK: - Private methods
    
    private func runCompletion(for controller: UIViewController) {
        guard let completion = self.completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
    
    // MARK: - Init methods
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
        self.completions = [:]
        super.init()
    
    }
}
