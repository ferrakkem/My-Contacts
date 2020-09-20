//
//  ContactcTableViewCell.swift
//  My Contacts
//
//  Created by Ferrakkem Bhuiyan on 2020-09-13.
//  Copyright © 2020 Ferrakkem Bhuiyan. All rights reserved.
//

import UIKit

class ContactcTableViewCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView?
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfigaration(userImage: String, name: String, otherInfo: String){
        
        //self.userImage = picture
        self.userName.text = name
        self.userInfo.text = otherInfo
        
        DispatchQueue.global().async { [weak self] in
            let url = URL(string: userImage)
            if url != nil{
                if let data = try? Data(contentsOf: url!) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.userImage?.image = image
                        }
                    }
                }
            }else{
                DispatchQueue.main.async {
                     self?.userImage?.image = UIImage.init(named: "noPicture.png")
                }
            }
        }
    }
    
}
