import Foundation
import UIKit

enum Theme: Int {
    
    case device
    case light
    case dark
    
    func getUserInterfaceStyle() -> UIUserInterfaceStyle {
        switch self {
        case .device:
            return .unspecified
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    
    func descriptions() -> String {
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
