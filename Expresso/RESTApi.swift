import Foundation

// MARK: RESTApi
protocol RESTApiType {
	func getMenu() -> String
	func placeOrder(order: Order)
}

class ExpressoApi: RESTApiType {
	func getMenu() -> String {
		// Stuck!  Need to figure out how to
		// make a GET request to our REST API...
		return ""
	}
	
	func placeOrder(order: Order) {
		// Stuck!  Need to figure out how to
		// send a POST request to our REST API...
	}
}



// MARK: MenuCreator
protocol MenuCreatorType {
	func beveragesForMenu() -> [Beverage]
}

extension MenuCreatorType {
	func beveragesForMenu() -> [Beverage] {
		let beverages: [Beverage] = [
			Beverage(name: "Americano"),
			Beverage(name: "Cappuccino"),
			Beverage(name: "Flat White"),
			Beverage(name: "Caffè Macchiato"),
			Beverage(name: "Dark Chocolate Mocha"),
			Beverage(name: "White Chocolate Mocha"),
			Beverage(name: "Latte"),
			Beverage(name: "Salted Caramel Mocha"),
		]

		return beverages.sort(){
			$0.name < $1.name
		}
	}
}

struct ExpressoMenuCreator: MenuCreatorType {}