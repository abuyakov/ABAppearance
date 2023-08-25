import UIKit

enum AppIcon: Int {
    
    case defaultIcon
    case alternativeIcon1
    case alternativeIcon2
    
    var iconStyle: String {
        switch self {
        case .defaultIcon:
            return "defaultIcon"
        case .alternativeIcon1:
            return "alternativeIcon1"
        case .alternativeIcon2:
            return "alternativeIcon2"
        }
    }
    
    var description: String {
        switch self {
        case .defaultIcon:
            return "Default Icon"
        case .alternativeIcon1:
            return "Alternative Icon 1"
        case .alternativeIcon2:
            return "Alternative Icon 2"
        }
    }
    
}
