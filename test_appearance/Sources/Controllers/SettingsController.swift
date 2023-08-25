import UIKit

class SettingsController: UITableViewController {
    
    static let identifier = String(describing: SettingsController.self)
    
    @IBOutlet weak var themeValueLabel: UILabel!
    @IBOutlet weak var colorValueLabel: UILabel!
    @IBOutlet weak var iconValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .abBackground
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        themeValueLabel.text = UserDefaultsManager.shared.theme.description
        colorValueLabel.text = UserDefaultsManager.shared.color.description
        colorValueLabel.textColor = UserDefaultsManager.shared.color.colorStyle
        iconValueLabel.text = UserDefaultsManager.shared.icon.description
    }
    
    
}

extension SettingsController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            presentController(identifier: ThemeController.identifier)
        case 1:
            presentController(identifier: ColorController.identifier)
        case 2:
            presentController(identifier: IconController.identifier)
        default:
            return
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .abView
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    private func presentController(identifier: String) {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
