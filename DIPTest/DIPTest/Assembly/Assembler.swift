//
//  Assembler.swift
//  DIPTest
//
//  Created by Uladzislau Abramchuk on 12/19/20.
//

import Dip

protocol Assembly {
    func assemble(container: DependencyContainer)
}

extension DependencyContainer {
    func addAssemblers(assemblers: [Assembly]) {
        assemblers.forEach { $0.assemble(container: self) }
    }
}
