//
//  RecentPostCell.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 24/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit
//import WCLShineButton
protocol FavourieteOrUnFavouriteDelegate {
    func isFavOrUnFavourite(cell : RecentPostCell , index : IndexPath , isTrue : Int)
    
}
class RecentPostCell: UICollectionViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imageOfUserPost: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btn1: WCLShineButton!
    @IBOutlet weak var btnFav: UIButton!
    var delegate : FavourieteOrUnFavouriteDelegate?
    var selectIndex : IndexPath?

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.lblName.text = nil
        self.imageOfUserPost.image = nil
        self.lblPrice.text = nil
        self.lblAddress.text = nil

    }
    
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.5) {
                let scale: CGFloat = 0.9
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: scale, y: scale) : .identity
            }
        }
    }

    func setCellData(post : GetUserPostObject) {
        var param1 = WCLShineParams()
        param1.bigShineColor = UIColor(rgb: (103,114,229))
        param1.smallShineColor = UIColor(rgb: (103,114,229))
        param1.animDuration = 4
        btn1.params = param1
        btn1.isSelected = false

    }
    @IBAction func action(_ sender: WCLShineButton) {
        if sender.isSelected == true {
            self.delegate?.isFavOrUnFavourite(cell: self, index: selectIndex!, isTrue: 1)
        } else {
            self.delegate?.isFavOrUnFavourite(cell: self, index: selectIndex!, isTrue: 0)
        }
        print("Clicked \(sender.isSelected)")
    }

    
}
