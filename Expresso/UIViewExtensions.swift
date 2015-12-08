import UIKit

extension UIView {
	func fadeIn(duration duration: NSTimeInterval = 0.75, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
		UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
			self.alpha = 1.0
			}, completion: completion)  }
	
	func fadeOut(duration duration: NSTimeInterval = 0.75, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
		UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
			self.alpha = 0.0
			}, completion: completion)
	}
}