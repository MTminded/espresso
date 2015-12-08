import UIKit

class OrderController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var beverageNameLabel: UILabel!
	@IBOutlet weak var customerNameTextField: UITextField!
	@IBOutlet weak var quantitySlider: UISlider!
	@IBOutlet weak var quantityLabel: UILabel!
	@IBOutlet weak var sizePicker: UISegmentedControl!
	@IBOutlet weak var totalLabel: UILabel!
	@IBOutlet weak var orderButton: UIButton!
	
	var order: Order!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		beverageNameLabel.text = order.beverage.name
		beverageNameLabel.textColor = ColorScheme.body
		
		quantitySlider.tintColor = ColorScheme.darkTint
		quantitySlider.minimumValue = 1
		quantitySlider.maximumValue = 10
		quantitySlider.value = 1
		
		sizePicker.tintColor = ColorScheme.darkTint
		
		let formattedTotalPrice = String(format: "%.2f", order.size.rawValue * Double(order.quantity))
		self.totalLabel.text = "Total: $\(formattedTotalPrice)"
		
		orderButton.backgroundColor = ColorScheme.background
		orderButton.tintColor = ColorScheme.tint
	}
	
	@IBAction func sliderChanged(sender: UISlider) {
		order.quantity = Int(sender.value)
		quantityLabel.text = String(order.quantity)
	}

	@IBAction func sliderChangeComplete(sender: UISlider) {
		let selectedSize = beverageSizeFromSegmentedControl(sizePicker)
		recalculateTotal(quantity: Int(sender.value), size: selectedSize)
	}
	
	@IBAction func sizePickerValueChanged(sender: UISegmentedControl) {
		let selectedSize = beverageSizeFromSegmentedControl(sender)
		recalculateTotal(quantity: Int(quantitySlider.value), size: selectedSize)
	}
	
	@IBAction func orderButtonTapped(sender: UIButton) {
		let alert = UIAlertController(title: "Order Placed!", message: "Thank you for your order.\nWe'll see you soon!", preferredStyle: .Alert)
		let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {
			(_)in
			self.performSegueWithIdentifier("unwindToExpressoMenu", sender: self)
		})
		
		alert.addAction(OKAction)
		self.presentViewController(alert, animated: true, completion: nil)
	}
	
	func recalculateTotal(quantity quantity: Int, size: Size) {
		totalLabel.fadeOut(duration: 0.5){(finished: Bool) -> Void in
			let formattedTotalPrice = String(format: "%.2f", size.rawValue * Double(quantity))
			self.totalLabel.text = "Total: $\(formattedTotalPrice)"
			self.totalLabel.fadeIn(duration: 0.5)
		}
	}
	
	func beverageSizeFromSegmentedControl(control: UISegmentedControl) -> Size {
		switch control.selectedSegmentIndex {
		case 0:
			return .Small
		case 1:
			return .Medium
		case 2:
			return .Large
		default:
			return .Small
		}
	}
	
	@IBAction func contentViewTapped(sender: UITapGestureRecognizer) {
		customerNameTextField.resignFirstResponder()
	}
	
	//MARK: UITextFieldDelegate
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		customerNameTextField.resignFirstResponder()
		return false
	}
}