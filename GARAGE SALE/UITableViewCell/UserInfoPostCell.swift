//
//  UserInfoPostCell.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 25/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

protocol MakeOfferDelegate {
    func makeOfferSent(cell : UserInfoPostCell  , index : IndexPath)
}
class UserInfoPostCell: UITableViewCell {
    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserAddress: UILabel!
    var delegate : MakeOfferDelegate?
    var indexSelect : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnMakeOffer_Pressed(_ sender: UIButton) {
        self.delegate?.makeOfferSent(cell: self, index: indexSelect!)
    }
}
