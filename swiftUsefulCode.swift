
//How to Add the Ability to use enter and screen press to remove keyboard
//First add UITextFieldDelegate to UIViewController than add code bellow
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    self.view.endEditing(true)  //This handles touching the screen
}

func textFieldShouldReturn(_ textField: UITextField) -> Bool {

    textField.resignFirstResponder() //This handles hitting the return key
    return true
}

//How to Add a TableView
//In the UIViewController first add UITableViewDataSource, UITableViewDelegate
//This function sets the number of rows for a table view
internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
}

//This function populates the individual cells with data
internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")

    cell.textLabel?.text = items[indexPath.row]
    return cell
}

//This function handles swipping to the right to remove the cell from the TableView
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

    if editingStyle == UITableViewCellEditingStyle.delete {
        items.remove(at: indexPath.row)
        table.reloadData()
        UserDefaults.standard.set(items, forKey: "items")
    }
}

//How to Add and Remove stored data to the phone
UserDefaults.standard.set(items, forKey : "items") //This sets/saves the data to the phone
UserDefaults.standard.object(forKey: "items") //This retrieves data (Object) from memory 
