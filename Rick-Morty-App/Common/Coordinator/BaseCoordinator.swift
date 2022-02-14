//
//  BaseCoordinator.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 04/02/2022.
//

import UIKit

class BaseCoordinator: Coordinator {
    // MARK: - Coordinator
    /// start the navigation
    func start() {
        assertionFailure("Child Coordinator must override this!")
    }
}
