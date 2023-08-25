# ABAppearance

<img width="1280" alt="Frame 1" src="https://github.com/abuyakov/ABAppearance/assets/56303086/80208a23-4410-497f-aa67-b5b064ce7cf3">

## About

I tried to create a project where you can globally change the appearance of the application (`theme`, `color`, `icon`). Perhaps someone was looking for such a solution.

Put a ⭐️ if I helped you, and write ideas on what can be done better.

## Сapability

### Themes

`.unspecified` The appearance the system used.

`.light` Permanent light appearance.

`.dark` Permanent dark appearance.

### Colors

`.red` `.pink` `.yellow` `.green` `.blue` and colors that you like.

### Icons

In my project, I added two alternative icons and one and the same default icon to display it in the table. You should add your icons not to assets, but as a file to the project. And add them to `Info.plist` and specify the names of these icons (see screenshot).

<img width="1198" alt="Screenshot 2023-08-25 at 16 09 53" src="https://github.com/abuyakov/ABAppearance/assets/56303086/a75a7953-8e4e-46be-86c6-24a6d61494d9">

## Important

In **SceneDelegate** I specify `self.window?.tintColor` and `self.window?.overrideUserInterfaceStyle` values from **UserDefaultsManager**.

```swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: SettingsController.identifier)
        
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: sceneWindow)
        self.window?.rootViewController = UINavigationController(rootViewController: viewController)
        self.window?.makeKeyAndVisible()
        self.window?.tintColor = UserDefaultsManager.shared.color.colorStyle
        self.window?.overrideUserInterfaceStyle = UserDefaultsManager.shared.theme.userInterfaceStyle
    }

}
```

In **AppDelegate**, I do a check for the first launch of the application and setting default values.

```swift
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UserDefaultsManager.shared.setDefaultValuesIfNeeded()
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
}
```

These are two functions for checking and setting default values in **UserDefaultsManager**.

```swift
class UserDefaultsmanager {
    // ... (other code)

    func setDefaultValuesIfNeeded() {
        // Check if the app has been launched before (first launch)
        if !userDefaults.bool(forKey: Key.isFirstLaunch) {
            // Call the setDefaultValues() method to set default values
            setDefaultValues()
        }
    }
    
    private func setDefaultValues() {
        // Set the isFirstLaunch value to true
        userDefaults.set(true, forKey: Key.isFirstLaunch)
        // Set the autoTheme value to true (for automatic theme change)
        userDefaults.set(true, forKey: Key.autoTheme)
        // Set the selectedColor value to 7 (for example, representing blue color)
        userDefaults.set(7, forKey: Key.selectedColor)
        // Set the selectedIcon value to 0 (for example, representing the main icon)
        userDefaults.set(0, forKey: Key.selectedIcon)
    }
}
```
