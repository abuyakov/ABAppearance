import UIKit

class AppearanceController: UITableViewController {

    static let identifier = "AppearanceController"
    
    @IBOutlet weak var modeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Appearance"
        self.navigationItem.largeTitleDisplayMode = .never
        self.tableView.allowsMultipleSelection = false
        
        modeSwitch.isOn = UserDefaults.standard.bool(forKey: DefaultKeys.switchState)
        debugPrint(ThemeService.shared.theme.descriptions())
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
        if modeSwitch.isOn == true {
            return 1
        } else {
            return 2
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        switch indexPath.section {
        case 1:
            if indexPath.row == 0 {
                ThemeService.shared.theme = Theme(rawValue: 1) ?? .light
                view.window?.overrideUserInterfaceStyle = ThemeService.shared.theme.getUserInterfaceStyle()
                tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }
            if indexPath.row == 1 {
                ThemeService.shared.theme = Theme(rawValue: 2) ?? .dark
                view.window?.overrideUserInterfaceStyle = ThemeService.shared.theme.getUserInterfaceStyle()
                tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            }
            tableView.reloadData()
            cell?.selectionStyle = .none
            print("Selected row: \(indexPath.row) :: \(ThemeService.shared.theme.descriptions())")
        default:
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            if indexPath.row == 0 {
                if ThemeService.shared.theme.rawValue == 1 {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
            }
            if indexPath.row == 1 {
                if ThemeService.shared.theme.rawValue == 2 {
                    cell.accessoryType = .checkmark
                } else {
                    cell.accessoryType = .none
                }
            }
        default:
            return
        }
    }

}
