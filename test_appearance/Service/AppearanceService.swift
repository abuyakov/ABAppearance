import Foundation

struct AppearanceService {
    
    static var shared = AppearanceService()
    
    var theme: Themes {
        get {
            Themes(rawValue: UserDefaults.standard.integer(forKey: DefaultKeys.selectedTheme)) ?? .device
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: DefaultKeys.selectedTheme)
        }
    }
    
    var color: Colors {
        get {
            Colors(rawValue: UserDefaults.standard.integer(forKey: DefaultKeys.selectedColor)) ?? .blue
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: DefaultKeys.selectedColor)
        }
    }
}
