//
//  GSPostDetailVC.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 25/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit
import ImageSlideshow
import SDWebImage
class GSPostDetailVC: UIViewController {
    @IBOutlet weak var tblViewss: UITableView!
    @IBOutlet var txtPriceEnter: UITextField!
    var postDetail : GetUserPostObject?
    let sdWebImageSource = [SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    @IBOutlet weak var btnSendOffer : UIButton!
    @IBOutlet var viewOfPop: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblViewss.register(UINib(nibName: "PostDetailImageScrollCell", bundle: nil), forCellReuseIdentifier: "PostDetailImageScrollCell")
        tblViewss.register(UINib(nibName: "PostDetailInfoCell", bundle: nil), forCellReuseIdentifier: "PostDetailInfoCell")
        tblViewss.register(UINib(nibName: "UserInfoPostCell", bundle: nil), forCellReuseIdentifier: "UserInfoPostCell")
        tblViewss.delegate = self
        tblViewss.dataSource = self
        tblViewss.reloadData()
        viewOfPop.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCross_Pressed(_ sender: UIButton) {
        viewOfPop.isHidden = true

    }
    
    @IBAction func btnSendOffer_Pressed(_ sender: UIButton) {
        
    }
    
//    @objc func didTap() {
//        let fullScreenController = slideshow.presentFullScreenController(from: self)
//        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
//        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
//    }
//

}

extension GSPostDetailVC : UITableViewDelegate , UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostDetailImageScrollCell", for: indexPath) as? PostDetailImageScrollCell
            cell!.slideshow.slideshowInterval = 3.0
            cell!.slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
            cell!.slideshow.contentScaleMode = UIView.ContentMode.scaleAspectFill
            
            let pageControl = UIPageControl()
            pageControl.currentPageIndicatorTintColor = UIColor(red: 103/255.0, green: 114/255.0, blue: 229/255.0, alpha: 1.0)
            pageControl.pageIndicatorTintColor = UIColor.lightGray
            cell!.slideshow.pageIndicator = pageControl
            cell!.slideshow.activityIndicator = DefaultActivityIndicator()
            cell!.slideshow.contentScaleMode = UIView.ContentMode.scaleAspectFill
            cell!.slideshow.clipsToBounds = true
            cell!.slideshow.activityIndicator = DefaultActivityIndicator()
            
            var sdWebImages = [SDWebImageSource]()

            for (_ , obj) in ((self.postDetail?.postImages?.enumerated())!) {
                sdWebImages.append(SDWebImageSource(urlString: obj.imageLink!)!)
            }
            cell!.slideshow.setImageInputs(sdWebImages)
            cell?.delegate = self
            cell?.selectIndex = indexPath

            return cell!
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostDetailInfoCell", for: indexPath) as? PostDetailInfoCell
            cell?.lblDescription.text = self.postDetail?.productDescription
            cell?.lblTime.text = self.postDetail?.publishedAt
            cell?.lblAddress.text = self.postDetail?.productLocalisation
            let priceOfitem = self.postDetail?.productPrice
            
            cell?.lblPrice.text = "$ \(priceOfitem!)"
            cell?.lblProdductName.text = self.postDetail?.productName
            return cell!

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoPostCell", for: indexPath) as? UserInfoPostCell
            cell?.lblUserName.text = self.postDetail?.user?.name
            cell?.lblUserAddress.text = self.postDetail?.user?.email
            cell?.delegate = self
            cell?.indexSelect = indexPath
            guard  let image = postDetail!.user?.profilePictureLink  else   {
                return cell!
            }
            WAShareHelper.loadImage(urlstring:image , imageView: (cell!.userProfilePic!), placeHolder: "profile2")
            let cgFloat: CGFloat = cell!.userProfilePic.frame.size.width/2.0
            let someFloat = Float(cgFloat)
            WAShareHelper.setViewCornerRadius(cell!.userProfilePic, radius: CGFloat(someFloat))

            
            return cell!

        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 350.0
        } else if indexPath.section == 1 {
            return UITableView.automaticDimension
        } else {
            return 77.0
        }
    }
    
   



}

extension GSPostDetailVC : PostDetailDelegate {
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func favOrUnFav(cell: PostDetailImageScrollCell, index: IndexPath) {
        
    }
}

extension GSPostDetailVC : MakeOfferDelegate {
    func makeOfferSent(cell: UserInfoPostCell, index: IndexPath) {
        
    }
}
