//
//  PostDetailImageScrollCell.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 25/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit
import ImageSlideshow

protocol PostDetailDelegate {
    func back()
    func favOrUnFav(cell : PostDetailImageScrollCell  , index : IndexPath)
}

class PostDetailImageScrollCell: UITableViewCell {
    
    @IBOutlet var slideshow: ImageSlideshow!
    var delegate : PostDetailDelegate?
    var selectIndex : IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnBack_Pressed(_ sender: UIButton) {
        self.delegate?.back()
    }
    
    @IBAction func btnFavOrUnFav_Pressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.delegate?.favOrUnFav(cell: self, index: selectIndex!)
    }
    
    
}
