import Foundation

struct Beverage {
	let name: String
	
	init(name: String) {
		self.name = name
	}
}

enum Size: Double {
	case Small = 1.50
	case Medium = 3.00
	case Large = 4.50
}


struct Order {
	var customerName: String
	var beverage: Beverage
	var quantity: Int
	var size: Size
	
	init(withCustomerName customerName: String, beverage: Beverage, quantity: Int = 1, size: Size = .Small) {
		self.customerName = customerName
		self.beverage = beverage
		self.quantity = quantity
		self.size = size
	}
}