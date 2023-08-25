import UIKit

enum AppTheme: Int {
    
    case device
    case light
    case dark
    
    var userInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .device:
            return .unspecified
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    
    var description: String {
        switch self {
        case .device:
            return "Automatically"
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        }
    }
    
}
