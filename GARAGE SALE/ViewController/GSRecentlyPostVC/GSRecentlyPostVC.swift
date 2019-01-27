//
//  GSRecentlyPostVC.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 24/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

@available(iOS 12.0, *)
@available(iOS 12.0, *)
@available(iOS 12.0, *)
class GSRecentlyPostVC: UIViewController {
    
    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var lblAddress: UILabel!
    let arrayOfItemSize = [239.0, 300.0 , 400.0 , 280.0 , 210  , 300]
    var responseObj: UserResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblAddress.text = DEVICE_ADDRESS
       getAllPost()
        // Do any additional setup after loading the view.
    }
    
    func getAllPost() {
        
        self.showAnimation()
        WebServiceManager.get(params: nil, serviceName:GET_ALLPOST , serviceType: "Publish Product", modelType: UserResponse.self, success: {[weak self] (response) in
            self!.dismissLoadingView()
            
            self!.responseObj = (response as! UserResponse)
            if  self!.responseObj?.status == true {
                self!.collectionViewLayoutDesign()
                self!.postCollectionView.delegate = self
                self!.postCollectionView.dataSource = self
                self!.postCollectionView.reloadData()
            }
            else {
                
                
            }
        }) { (error) in
            self.dismissLoadingView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
      
        
        
    }
    
    
    
    func heightForView(text:String) -> CGFloat{
        
        
        let label:UILabel = UILabel(frame: CGRect(x:0, y:0, width:(ConstantDevices.SCREEN_WIDTH)/2 - 120, height:CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = UIFont(name: "OpenSans", size: 13)
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }

    

    func collectionViewLayoutDesign(){
        
        
        let layout: CHTCollectionViewWaterfallLayout = CHTCollectionViewWaterfallLayout()
        postCollectionView.collectionViewLayout = layout
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//        layout.headerHeight = 430.0
        layout.footerHeight = 0.0
        layout.minimumColumnSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.columnCount = 2
        
        postCollectionView.setCollectionViewLayout(layout, animated: true)
        postCollectionView.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
            postCollectionView.register(UINib(nibName: VCIdentifier.KRecentPostCell, bundle: nil), forCellWithReuseIdentifier: VCIdentifier.KRecentPostCell)
    }
    
    func isProductAddtoFavouriteOrNot(isSelected : Int , post : GetUserPostObject) {
        
        let productId = post.id
        
        let loginParam =      [ KProductID             : "\(productId!)",
                                KProductfavourite      : "\(isSelected)"
            ] as [String : Any]
//        self.showAnimation()
        WebServiceManager.post(params:loginParam as Dictionary<String, AnyObject> , serviceName: PRODUCT_FAVOURITE, isLoaderShow: true, serviceType: "Login", modelType: UserResponse.self, success: { [weak self] (response) in
            let responseObj = response as! UserResponse
//            self!.dismissLoadingView()
            if responseObj.status == true {
//                self!.showAlert(title: KMessageTitle , message: responseObj.message!, controller: self)
            }
            else {
                self!.showAlert(title: KMessageTitle , message: responseObj.message!, controller: self)
            }
            }, fail: { (error) in
//                self.dismissLoadingView()
                
        }, showHUD: true)

    }
}

@available(iOS 12.0, *)
extension GSRecentlyPostVC: UICollectionViewDataSource , UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.responseObj?.post?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VCIdentifier.KRecentPostCell, for: indexPath) as! RecentPostCell

        let priceOfItem = self.responseObj?.post![indexPath.row].productPrice
        cell.lblName.text = self.responseObj?.post![indexPath.row].productName
        cell.lblPrice.text = "$ \(priceOfItem!)"
        cell.lblAddress.text = self.responseObj?.post![indexPath.row].productLocalisation
        cell.setCellData(post: (self.responseObj?.post![indexPath.row])!)
        cell.delegate = self
        cell.selectIndex = indexPath
        if  self.responseObj?.post![indexPath.row].postImages?.count == 0 {
        
        } else  {
            guard  let image = self.responseObj?.post![indexPath.row].postImages![0].imageLink  else   {
                return cell
            }
            WAShareHelper.loadImage(urlstring:image , imageView: (cell.imageOfUserPost!), placeHolder: "profile2")
        }
        

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: VCIdentifier.kUserPostDetail) as? GSPostDetailVC
        vc?.postDetail = self.responseObj?.post![indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 0.9, animations: { () -> Void in
            cell.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        })

    }
//    func collectionView(_ collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
//    }
}

@available(iOS 12.0, *)
extension GSRecentlyPostVC: CHTCollectionViewDelegateWaterfallLayout {
    
    func collectionView (_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        var heightOfCell : Int?
        let totalCellHeight : Int?
        let myCGFloat: CGFloat
        let wid = collectionView.frame.size.width / 2 - 2
        
        if  self.responseObj?.post![indexPath.row].postImages?.count == 0 {
            totalCellHeight = 230
            myCGFloat = CGFloat(totalCellHeight!)

        } else {
            heightOfCell = Int((self.responseObj?.post![indexPath.row].postImages![0].imageHeight)!)
            totalCellHeight = heightOfCell! + 70
            myCGFloat = CGFloat(totalCellHeight!)

        }
        collectionView.layoutIfNeeded()

        return CGSize(width: wid, height: myCGFloat)
    }
}

@available(iOS 12.0, *)
extension GSRecentlyPostVC : FavourieteOrUnFavouriteDelegate {
    func isFavOrUnFavourite(cell: RecentPostCell, index: IndexPath, isTrue: Int) {
        if cell.btn1.isSelected == true {
            isProductAddtoFavouriteOrNot(isSelected: 1, post: (self.responseObj?.post![index.row])!)
        } else {
            isProductAddtoFavouriteOrNot(isSelected: 0, post: (self.responseObj?.post![index.row])!)
        }
        
    }
}
