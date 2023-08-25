import UIKit

class ThemeController: UITableViewController {
    
    static let identifier = String(describing: ThemeController.self)
    
    @IBOutlet weak var autoThemeSwitch: UISwitch!
    
    var userDefaultsManager = UserDefaultsManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Theme"
        view.backgroundColor = .abBackground
        navigationItem.largeTitleDisplayMode = .never
        
        autoThemeSwitch.isOn = userDefaultsManager.autoTheme
    }
    
    // MARK: -- Actions --
    
    @IBAction func autoThemeValueChanged(sender: UISwitch) {
        if autoThemeSwitch.isOn {
            userDefaultsManager.autoTheme = true
            userDefaultsManager.theme = .device
            view.window?.overrideUserInterfaceStyle = userDefaultsManager.theme.userInterfaceStyle
        } else {
            userDefaultsManager.autoTheme = false
            userDefaultsManager.theme = .light
            view.window?.overrideUserInterfaceStyle = userDefaultsManager.theme.userInterfaceStyle
        }
        tableView.reloadData()
    }
    
    //MARK: -- Helpers --
    
    private func didSelectTheme(theme: AppTheme) {
        userDefaultsManager.theme = theme
        view.window?.overrideUserInterfaceStyle = userDefaultsManager.theme.userInterfaceStyle
        
        autoThemeSwitch.isOn = false
        userDefaultsManager.autoTheme = false
    }
    
    private func updateThemeAccessoryType(value: Int, cell: UITableViewCell) {
        cell.accessoryType = userDefaultsManager.theme.rawValue == value ? .checkmark : .none
    }
    
}

// MARK: -- Extension --

extension ThemeController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (1, 0):
            didSelectTheme(theme: .light)
        case (1, 1):
            didSelectTheme(theme: .dark)
        default:
            return
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
        cell.backgroundColor = .abView
        
        switch indexPath.section {
        case 1:
            updateThemeAccessoryType(value: indexPath.row + 1, cell: cell)
        default:
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}
