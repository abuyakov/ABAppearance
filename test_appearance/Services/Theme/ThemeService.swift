import Foundation

struct ThemeService {
    
    static var shared = ThemeService()
    
    var theme: Theme {
        get {
            Theme(rawValue: UserDefaults.standard.integer(forKey: DefaultKeys.selectedTheme)) ?? .device
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: DefaultKeys.selectedTheme)
        }
    }
}
