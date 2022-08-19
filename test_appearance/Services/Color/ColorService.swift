import Foundation

struct ColorService {
    
    static var shared = ColorService()
    
    var color: Colors {
        get {
            Colors(rawValue: UserDefaults.standard.integer(forKey: DefaultKeys.selectedColor)) ?? .blue
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: DefaultKeys.selectedColor)
        }
    }
}
