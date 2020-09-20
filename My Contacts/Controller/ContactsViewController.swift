//
//  ViewController.swift
//  My Contacts
//
//  Created by Ferrakkem Bhuiyan on 2020-09-11.
//  Copyright © 2020 Ferrakkem Bhuiyan. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    @IBOutlet weak var contactsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        setTableview()
    }
    
    //MARK: - setUp or Register UItableView
    func setTableview(){
        contactsTable.dataSource = self
        contactsTable.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellReuseIdentifier)
        contactsTable.contentInsetAdjustmentBehavior = .never
        contactsTable.reloadData()
    }

    @IBAction func addbuttonPressed(_ sender: UIBarButtonItem) {
        print("Add button Pressed")
        performSegue(withIdentifier: K.addContactIdentifier, sender: self)
    }
        
}

//MARK: - UITableViewDataSource
extension ContactsViewController: UITableViewDataSource, UITableViewDelegate{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellReuseIdentifier, for: indexPath) as! ContactcTableViewCell
        cell.cellConfigaration( name:"Kat Winslet", otherInfo: "Intrado.com")
        cell.userImage?.setRounded()

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.contactDetailsIdentifier, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == K.contactDetailsIdentifier) {
            // pass data to next view
            let destinationVc = segue.destination as! ContactDetailsViewController
            if let indexPath = contactsTable.indexPathForSelectedRow{
                //destinationVc.selectedContact =
            }
        }else if(segue.identifier == K.addContactIdentifier){
            let addDestinationVc = segue.destination as! AddContactViewController
            
        }
    }
}



