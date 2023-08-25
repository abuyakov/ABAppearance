import UIKit

class IconController: UITableViewController {
    
    static let identifier = String(describing: IconController.self)
    
    var userDefaultsManager = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Icon"
        view.backgroundColor = .abBackground
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: -- Helpers --
    
    func didSelectIcon(icon: AppIcon?) {
        if let selectedIcon = icon {
            userDefaultsManager.icon = selectedIcon
            UIApplication.shared.setAlternateIconName(selectedIcon.iconStyle)
        } else {
            userDefaultsManager.icon = .defaultIcon
            UIApplication.shared.setAlternateIconName(nil)
        }
    }
    
    func updateIconAccesoryType(value: Int, cell: UITableViewCell) {
        cell.accessoryType = userDefaultsManager.icon.rawValue == value ? .checkmark : .none
    }
    
}

// MARK: -- Extension --

extension IconController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            didSelectIcon(icon: nil)
        case 1:
            didSelectIcon(icon: .alternativeIcon1)
        case 2:
            didSelectIcon(icon: .alternativeIcon2)
        default:
            return
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
        cell.backgroundColor = .abView
        
        updateIconAccesoryType(value: indexPath.row, cell: cell)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
}
