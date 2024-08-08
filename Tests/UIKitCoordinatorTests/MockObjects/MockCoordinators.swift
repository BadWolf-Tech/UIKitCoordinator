import UIKit
@testable import UIKitCoordinator

class MockBaseCoordinator: BaseCoordinator {
    var startCalled = false

    override func start() {
        startCalled = true
    }
}

class MockCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    func start() {
        // Mock implementation of start
    }
}

class MockMainCoordinator: MainCoordinator {
    var startCalled = false
    var pushedViewController: UIViewController?

    override func start() {
        startCalled = true
        let viewController = MockViewController()
        pushedViewController = viewController
        navigationController.pushViewController(viewController, animated: false)
    }
}
