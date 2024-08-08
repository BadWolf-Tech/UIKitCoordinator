# UIKitCoordinator

UIKitCoordinator is a Swift package that provides a flexible and reusable implementation of the Coordinator pattern for UIKit applications. This package helps manage navigation flow and coordination between view controllers, ensuring a clean and modular architecture.

## Overview

The Coordinator pattern is a design pattern that helps manage navigation in an application. By using coordinators, you can separate navigation logic from view controllers, making your codebase more modular and easier to maintain. This package includes:

- `Coordinator` protocol: Defines the basic requirements for all coordinators.
- `BaseCoordinator` class: Provides a foundation for all coordinators with basic functionality for managing child coordinators.
- `AppCoordinator` class: Manages the main flow of the application and sets up the root view controller.
- `MainCoordinator` class: Manages the main navigation flow and presents the initial view controller.

## Installation

To add UIKitCoordinator to your Xcode project, follow these steps:

1. **Open your project in Xcode**.
2. **Go to `File` > `Add Packages`**.
3. **Enter the repository URL**: `https://github.com/BadWolf-Tech/UIKitCoordinator.git`.
4. **Choose the latest version** and click **Add Package**.

## Basic Usage

### Step 1: Define Your Coordinators

Create your own coordinators by subclassing `BaseCoordinator` and implementing the `start` method.

#### Example: MainCoordinator

```swift
import UIKit
import UIKitCoordinator

class MainCoordinator: BaseCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    override func start() {
        let viewController = MyViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
}
```

### Step 2: Setup AppCoordinator

Use `AppCoordinator` to manage the main flow of your application and set up the root view controller.

#### Example: AppDelegate

```swift
import UIKit
import UIKitCoordinator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()

        appCoordinator = AppCoordinator(window: window!, navigationController: navigationController)
        appCoordinator?.start()

        return true
    }
}
```

### Step 3: Implement View Controllers

Ensure your view controllers have a reference to their coordinator.

#### Example: MyViewController

```swift
import UIKit

class MyViewController: UIViewController {
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Setup your UI components and logic here
    }
}
```

## Contribution Guidelines

We welcome contributions to UIKitCoordinator! To contribute, follow these steps:

1. **Fork the repository**.
2. **Create a new branch** for your feature or bug fix.
3. **Commit your changes** with clear and descriptive messages.
4. **Push your branch** to your forked repository.
5. **Open a pull request** with a detailed description of your changes.

### Coding Standards

- Follow the Swift API Design Guidelines.
- Write clear and concise documentation for your code.
- Ensure your code is well-tested.

### Running Tests

To run the tests for UIKitCoordinator, execute the following command:

```bash
swift test
```

### Reporting Issues

If you encounter any issues or have suggestions for improvements, please open an issue on the [GitHub repository](https://github.com/BadWolf-Tech/UIKitCoordinator/issues).

## License

UIKitCoordinator is released under the MIT License. See the [LICENSE](LICENSE.txt) file for more information.

---

Thank you for using UIKitCoordinator! We hope it helps you build clean and modular UIKit applications.