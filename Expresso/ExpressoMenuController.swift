import UIKit

class ExpressoMenuController: UITableViewController {

	let menuCreator = ExpressoMenuCreator()
	lazy var beverages: [Beverage] = {
		[unowned self] in
		return self.menuCreator.beveragesForMenu()
	}()
	
	// MARK: View Controller Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	// MARK: TableView Data Source
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
 
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return beverages.count
	}
 
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("menuCell")!
		
		cell.textLabel?.text = beverages[indexPath.row].name
		return cell
	}
	
	// MARK: Navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		let orderController = segue.destinationViewController as! OrderController
		let selectedRow = tableView.indexPathForSelectedRow!.row
		orderController.order = Order(withCustomerName: "", beverage: beverages[selectedRow], quantity: 1)
	}
	
	@IBAction func unwindToExpressoMenu(segue: UIStoryboardSegue) {}
}

