import UIKit

class SettingsController: UITableViewController {

    static let identifier = "SettingsController"
    
    @IBOutlet weak var modeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        self.navigationItem.largeTitleDisplayMode = .never
        self.tableView.allowsMultipleSelection = false
        UITableViewCell.appearance().selectionStyle = .none
        
        modeSwitch.isOn = UserDefaults.standard.bool(forKey: DefaultKeys.switchState)
    }
    
    @IBAction func switchValueChanged(sender: UISwitch) {
        if modeSwitch.isOn {
            UserDefaults.standard.set(true, forKey: DefaultKeys.switchState)
            AppearanceService.shared.theme = Themes(rawValue: 0) ?? .device
            view.window?.overrideUserInterfaceStyle = AppearanceService.shared.theme.getUserInterfaceStyle()
        }
        else {
            UserDefaults.standard.set(false, forKey: DefaultKeys.switchState)
            AppearanceService.shared.theme = Themes(rawValue: 1) ?? .light
            view.window?.overrideUserInterfaceStyle = AppearanceService.shared.theme.getUserInterfaceStyle()
        }
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (1, 0...1):
            didSelectTheme(value: indexPath.row + 1, theme: .light, index: indexPath)
        case (2, 0...7):
            didSelectColor(value: indexPath.row, color: .blue, index: indexPath)
        default:
            return
        }
        tableView.reloadData()
        print("Selected: \(AppearanceService.shared.theme.descriptions()) + \(AppearanceService.shared.color.descriptions())")
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (1, 0...1):
            willSelectedTheme(value: indexPath.row + 1, cell: cell)
        case (2, 0...7):
            willSelectedColor(value: indexPath.row, cell: cell)
        default:
            return
        }
    }
    
    func didSelectColor(value: Int, color: Colors, index: IndexPath) {
        AppearanceService.shared.color = Colors(rawValue: value) ?? color
        view.window?.tintColor = AppearanceService.shared.color.getColorStyle()
        let cell = tableView.cellForRow(at: index)
        cell?.accessoryType = .checkmark
    }
    
    func didSelectTheme(value: Int, theme: Themes, index: IndexPath) {
        AppearanceService.shared.theme = Themes(rawValue: value) ?? theme
        view.window?.overrideUserInterfaceStyle = AppearanceService.shared.theme.getUserInterfaceStyle()
        let cell = tableView.cellForRow(at: index)
        cell?.accessoryType = .checkmark
        
        modeSwitch.isOn = false
        UserDefaults.standard.set(false, forKey: DefaultKeys.switchState)
    }
    
    func willSelectedColor(value: Int, cell: UITableViewCell) {
        if AppearanceService.shared.color.rawValue == value {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func willSelectedTheme(value: Int, cell: UITableViewCell) {
        if AppearanceService.shared.theme.rawValue == value {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

}
