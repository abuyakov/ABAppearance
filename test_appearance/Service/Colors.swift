import UIKit

enum Colors: Int {
    
    case red
    case pink
    case orange
    case yellow
    case green
    case blue
    case purple
    case gray
    
    func getColorStyle() -> UIColor {
        switch self {
        case .red:
            return .systemRed
        case .pink:
            return .systemPink
        case .orange:
            return .systemOrange
        case .yellow:
            return .systemYellow
        case .green:
            return .systemGreen
        case .blue:
            return .systemBlue
        case .purple:
            return .systemPurple
        case .gray:
            return .systemGray
        }
    }
    
    func descriptions() -> String {
        switch self {
        case .red:
            return "Red"
        case .pink:
            return "Pink"
        case .orange:
            return "Orange"
        case .yellow:
            return "Yellow"
        case .green:
            return "Green"
        case .blue:
            return "Blue"
        case .purple:
            return "Purple"
        case .gray:
            return "Gray"
        }
    }
}
