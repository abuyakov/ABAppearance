import UIKit

class HomeController: UITableViewController {
    
    static let identifier = "HomeController"

    @IBOutlet weak var appearanceLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Window"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                                                 primaryAction: UIAction(handler: { _ in
            self.buttonTapped()
        }))
        
        self.tableView.allowsSelection = false
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appearanceLabel.textColor = .label
        appearanceLabel.text = AppearanceService.shared.theme.descriptions()
        
        colorLabel.textColor = .tintColor
        colorLabel.text = AppearanceService.shared.color.descriptions()
    }
    
    func buttonTapped() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: SettingsController.identifier)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

}
