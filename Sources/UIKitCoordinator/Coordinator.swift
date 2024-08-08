import UIKit

/// The `Coordinator` protocol defines a set of methods and properties that all coordinators must implement.
/// Coordinators are responsible for handling the navigation flow and coordination between view controllers.
public protocol Coordinator: AnyObject {

    /// An array to keep track of child coordinators.
    var childCoordinators: [Coordinator] { get set }

    /// Starts the coordinator.
    func start()
}

extension Coordinator {

    /// Adds a child coordinator to the parent coordinator.
    /// - Parameter coordinator: The child coordinator to be added.
    public func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    /// Removes a child coordinator from the parent coordinator.
    /// - Parameter coordinator: The child coordinator to be removed.
    public func removeChild(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}
