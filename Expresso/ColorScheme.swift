import Foundation
import UIKit

extension UIColor {
    static func colorWithRedValue(redValue redValue: CGFloat, greenValue: CGFloat, blueValue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: redValue/255.0, green: greenValue/255.0, blue: blueValue/255.0, alpha: alpha)
    }
}

struct ColorScheme {
    static let primary = UIColor.colorWithRedValue(redValue: 62, greenValue: 36, blueValue: 20, alpha: 1.0)
    static let accent = UIColor.colorWithRedValue(redValue: 140, greenValue: 77, blueValue: 41, alpha: 1.0)
	static let tint = UIColor.whiteColor()
	static let darkTint = UIColor.colorWithRedValue(redValue: 140, greenValue: 77, blueValue: 41, alpha: 1.0)
    static let background = UIColor.colorWithRedValue(redValue: 140, greenValue: 77, blueValue: 41, alpha: 1.0)
    static let body = UIColor.colorWithRedValue(redValue: 10, greenValue: 1, blueValue: 11, alpha: 1.0)
}