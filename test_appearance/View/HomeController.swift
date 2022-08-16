import UIKit

class HomeController: UITableViewController {
    
    static let identifier = "HomeController"

    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Colors"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Appearance",
                                                                 image: UIImage(systemName: "gear"),
                                                                 primaryAction: UIAction(handler: { _ in
            self.buttonTapped()
        }))
        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection = false
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        infoLabel.text = "The appearance is now \(ThemeService.shared.theme.descriptions())"
    }
    
    func buttonTapped() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: AppearanceController.identifier)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

}
