import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        checkDefaultsValues()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }

    
    func checkDefaultsValues() {
        let ud = UserDefaults.standard
        
        if ud.object(forKey: DefaultKeys.switchState) == nil {
            ud.set(true, forKey: DefaultKeys.switchState)
        }
        if ud.object(forKey: DefaultKeys.selectedColor) == nil {
            ud.set(5, forKey: DefaultKeys.selectedColor)
        }
    }
    
}

