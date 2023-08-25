import UIKit

class ColorController: UITableViewController {
    
    static let identifier = String(describing: ColorController.self)
    
    var userDefaultsManager = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Color"
        view.backgroundColor = .abBackground
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: -- Helpers --
    
    private func didSelectColor(color: Int) {
        userDefaultsManager.color = AppColor(rawValue: color) ?? .blue
        view.window?.tintColor = userDefaultsManager.color.colorStyle
    }
    
    private func updateColorAccesoryType(value: Int, cell: UITableViewCell) {
        cell.accessoryType = userDefaultsManager.color.rawValue == value ? .checkmark : .none
    }
    
}

// MARK: -- Extension --

extension ColorController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectColor(color: indexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
        cell.backgroundColor = .abView
        updateColorAccesoryType(value: indexPath.row, cell: cell)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}
