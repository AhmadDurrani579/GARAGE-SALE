//
//  GSAddProductVC.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 25/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class GSAddProductVC: UIViewController {
    
    @IBOutlet weak var addItemCollectionView: UICollectionView!
    let photoPicker = PhotoPicker()
    var morePhotos: [UIImage]? = []
    var cover_image: UIImage?
    @IBOutlet weak var txtProductName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var btnChoseType: UIButton!
    @IBOutlet weak var lblCategoryName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addItemCollectionView.delegate = self
        addItemCollectionView.dataSource = self
        
        
    }
    
    @IBAction func btnCategoryTypeSelect(_ sender: UIButton) {
        ActionSheetStringPicker.show(withTitle: KChoseCategory, rows: ["Fashion" , "Modeling" , "Other"] , initialSelection: 0 , doneBlock: {[weak self ] (picker, index, value) in
//            self!.btnChoseType.setTitle(value as? String , for: .normal)
            self!.lblCategoryName.text = value as? String
            print("values = \(value!)")
            print("indexes = \(index)")
            print("picker = \(picker!)")
            return
        }, cancel: { (actionStrin ) in
            
        }, origin: sender)
    }

//    let KProductName                 : String  = "productName"
//    let KProductCategory                 : String  = "productCategory"
//    let KProductAddress                : String  = "productLocalisation"
//    let KProductDescription                 : String  = "productDescription"
//    let KProductPrice                 : String  = "productPrice"
//    let KProductImage                 : String  = "productImages"

    @IBAction func btnPublishStory_Pressed(_ sender: UIButton) {
        
        let params =        [KProductName                         :  txtProductName.text!,
                             KProductCategory                     :  lblCategoryName.text! ,
                             KProductAddress                      :  txtAddress.text! ,
                             KProductDescription                  :  txtDescription.text! ,
                             KProductPrice                        :  txtPrice.text! ,

       
            ] as [String : Any]
        
        
        self.showAnimation()

        WebServiceManager.multiPartImageMorePhotos(params: params as Dictionary<String, AnyObject>, morePhotos: morePhotos , serviceName:PUBLIST_PRODUCT, imageParam: KProductImage, serviceType: "", profileImage: cover_image, cover_image_param: "", cover_image: nil, modelType: UserResponse.self, success: { [weak self] (response) in
            self!.dismissLoadingView()

            let parseResponse = response as! UserResponse
            if parseResponse.status == true {
                self!.showAlertViewWithTitle(title: KMessageTitle, message: parseResponse.message!, dismissCompletion: {
//                    self.navigationController?.popViewController(animated: true)
                })
                
            }else {
                self!.showAlert(title: KMessageTitle, message: parseResponse.message!, controller: self)
            }
        }, fail: { (error) in
            self.showAlert(title: "Error", message: "no internet", controller: self)
            self.dismissLoadingView()

        })

    }


}

extension GSAddProductVC: UICollectionViewDataSource , UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (morePhotos?.count)! + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VCIdentifier.KMorePhoteCell, for: indexPath) as! MorePhotoCell
    
        if indexPath.row != self.morePhotos?.count {
          cell.imagePhoto.image = morePhotos![indexPath.row]
        } else {
            cell.imagePhoto.image = UIImage(named: "upload_img")

        }
//        if indexPath.row == 0 {
//            cell.lblName.text  = "secondPageImage"
//            cell.imageOfUserPost.image = UIImage(named:"profile2")!
//        } else if indexPath.row == 1 {
//            cell.lblName.text  = "Hello "
//            cell.imageOfUserPost.image = UIImage(named:"profile3")!
//
//        } else if indexPath.row == 2 {
//            cell.lblName.text  = "Check it"
//            cell.imageOfUserPost.image = UIImage(named:"profile2")!
//
//        }else if indexPath.row == 3 {
//            cell.lblName.text  = "Amazing "
//            cell.imageOfUserPost.image = UIImage(named:"profile3")!
//
//        }else if indexPath.row == 4 {
//            cell.lblName.text  = "Nop Bro "
//            cell.imageOfUserPost.image = UIImage(named:"profile2")!
//
//        }else if indexPath.row == 5 {
//            cell.lblName.text  = "Hello "
//            cell.imageOfUserPost.image = UIImage(named:"profile3")!
//
//        }
//        cell.btnFav.isSelected = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == self.morePhotos?.count {
            photoPicker.pick(allowsEditing: false, pickerSourceType: .CameraAndPhotoLibrary, controller: self, successBlock: {[weak self] (orignal, edited) in
                let height = orignal?.size.height
                let width = orignal?.size.width
                let checkImage = orignal?.resizeCI(size: (orignal?.size)!)
                let afterCompressHeight = checkImage?.size.height
                let afterCompressWidth = checkImage?.size.width

                print(checkImage!)
                print(width!)
                print(afterCompressHeight!)
                print(width!)
                self!.morePhotos?.append(orignal!)
                self!.addItemCollectionView.reloadData()
//                self.navigationController?.pushViewController(vc!, animated: true)
            })
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wid = collectionView.frame.size.width/2 - 3
        return CGSize(width: wid, height: 150)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let visibleCells: [IndexPath] = addItemCollectionView.indexPathsForVisibleItems
//        let lastIndexPath = IndexPath(item: (morePhotos!.count - 1), section: 0)
//        if visibleCells.contains(lastIndexPath) {
//            self.addItemCollectionView.reloadItems(at: [lastIndexPath])
            //This means you reached at last of your datasource. and here you can do load more process from server
//        }
        
        var visibleRect = CGRect()
        visibleRect.origin = addItemCollectionView.contentOffset
        visibleRect.size = addItemCollectionView.bounds.size
        let visiblePoint = CGPoint(x: CGFloat(visibleRect.midX), y: CGFloat(visibleRect.midY))
        let visibleIndexPath: IndexPath? = addItemCollectionView.indexPathForItem(at: visiblePoint)
        print("Visible cell's index is : \(visibleIndexPath?.row)!")
    }
    
    
}

extension UIImage {
    func resizeCI(size:CGSize) -> UIImage? {
        let scale = (Double)(size.width) / (Double)(self.size.width)
        let image = UIKit.CIImage(cgImage:self.cgImage!)
        
        let filter = CIFilter(name: "CILanczosScaleTransform")!
        filter.setValue(image, forKey: kCIInputImageKey)
        filter.setValue(NSNumber(value:scale), forKey: kCIInputScaleKey)
        filter.setValue(1.0, forKey:kCIInputAspectRatioKey)
        let outputImage = filter.value(forKey: kCIOutputImageKey) as! UIKit.CIImage
        
        let context = CIContext(options: [CIContextOption.useSoftwareRenderer: false])
        let resizedImage = UIImage(cgImage: context.createCGImage(outputImage, from: outputImage.extent)!)
        return resizedImage
    }
}
