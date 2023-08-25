import UIKit

struct UserDefaultsManager {
    
    static var shared = UserDefaultsManager()
    private var userDefaults: UserDefaults { return UserDefaults.standard }
    
    private enum Key {
        static let isFirstLaunch = "isAppAlreadyLaunchedOnce"
        static let autoTheme = "autoTheme"
        static let selectedTheme = "selectedTheme"
        static let selectedColor = "selectedColor"
        static let selectedIcon = "selectedIcon"
    }
    
    var autoTheme: Bool {
        get { userDefaults.bool(forKey: Key.autoTheme) }
        set { userDefaults.set(newValue, forKey: Key.autoTheme) }
    }
    
    var theme: AppTheme {
        get { AppTheme(rawValue: userDefaults.integer(forKey: Key.selectedTheme)) ?? .device }
        set { userDefaults.set(newValue.rawValue, forKey: Key.selectedTheme) }
    }
    
    var color: AppColor {
        get { AppColor(rawValue: userDefaults.integer(forKey: Key.selectedColor)) ?? .blue }
        set { userDefaults.set(newValue.rawValue, forKey: Key.selectedColor) }
    }
    
    var icon: AppIcon {
        get { AppIcon(rawValue: userDefaults.integer(forKey: Key.selectedIcon)) ?? .defaultIcon }
        set { userDefaults.set(newValue.rawValue, forKey: Key.selectedIcon) }
    }
    
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
