import UIKit

class SettingsController: UITableViewController {

    static let identifier = "SettingsController"
    
    @IBOutlet weak var modeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        self.navigationItem.largeTitleDisplayMode = .never
        self.tableView.allowsMultipleSelection = false
        
        modeSwitch.isOn = UserDefaults.standard.bool(forKey: DefaultKeys.switchState)
    }
    
    @IBAction func switchValueChanged(sender: UISwitch) {
        if modeSwitch.isOn {
            UserDefaults.standard.set(true, forKey: DefaultKeys.switchState)
            ThemeService.shared.theme = Theme(rawValue: 0) ?? .device
            view.window?.overrideUserInterfaceStyle = ThemeService.shared.theme.getUserInterfaceStyle()
        }
        else {
            UserDefaults.standard.set(false, forKey: DefaultKeys.switchState)
            ThemeService.shared.theme = Theme(rawValue: 1) ?? .light
            view.window?.overrideUserInterfaceStyle = ThemeService.shared.theme.getUserInterfaceStyle()
        }
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            if 0...1 ~= indexPath.row {
                didSelectTheme(value: indexPath.row + 1, theme: .light, index: indexPath)
            }
        case 2:
            if 0...7 ~= indexPath.row {
                didSelectColor(value: indexPath.row, color: .blue, index: indexPath)
            }
        default:
            return
        }
        tableView.reloadData()
        print("Selected: \(ThemeService.shared.theme.descriptions()) + \(ColorService.shared.color.descriptions())")
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            if 0...1 ~= indexPath.row {
                willSelectedTheme(value: indexPath.row + 1, cell: cell)
            }
        case 2:
            if 0...7 ~= indexPath.row {
                willSelectedColor(value: indexPath.row, cell: cell)
            }
        default:
            return
        }
    }
    
    func didSelectColor(value: Int, color: Colors, index: IndexPath) {
        ColorService.shared.color = Colors(rawValue: value) ?? color
        view.window?.tintColor = ColorService.shared.color.getColorStyle()
        let cell = tableView.cellForRow(at: index)
        cell?.selectionStyle = .none
        cell?.accessoryType = .checkmark
    }
    
    func didSelectTheme(value: Int, theme: Theme, index: IndexPath) {
        ThemeService.shared.theme = Theme(rawValue: value) ?? theme
        view.window?.overrideUserInterfaceStyle = ThemeService.shared.theme.getUserInterfaceStyle()
        let cell = tableView.cellForRow(at: index)
        cell?.selectionStyle = .none
        cell?.accessoryType = .checkmark
        
        modeSwitch.isOn = false
        UserDefaults.standard.set(false, forKey: DefaultKeys.switchState)
    }
    
    func willSelectedColor(value: Int, cell: UITableViewCell) {
        if ColorService.shared.color.rawValue == value {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func willSelectedTheme(value: Int, cell: UITableViewCell) {
        if ThemeService.shared.theme.rawValue == value {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }

}
