import UIKit

/// The `BaseCoordinator` class provides a foundation for all coordinators in the application.
/// It implements the `Coordinator` protocol and provides basic functionality for managing child coordinators.
open class BaseCoordinator: Coordinator {

    /// An array to keep track of child coordinators.
    public var childCoordinators: [Coordinator] = []

    /// A closure that is called when the coordinator has completed its task.
    public var isCompleted: (() -> Void)?

    /// Initializes a new instance of `BaseCoordinator`.
    public init() {}

    /// Starts the coordinator. This method should be overridden by subclasses.
    open func start() {
        fatalError("Start method should be implemented.")
    }
}
