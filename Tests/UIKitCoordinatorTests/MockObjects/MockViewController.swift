import UIKit

class MockViewController: UIViewController {
    var isPushed = false

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isPushed = true
    }
}
