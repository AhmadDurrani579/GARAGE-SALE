//
//  GSUploadInfo.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 24/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

class GSUploadInfo: UIViewController {

    @IBOutlet weak var txtIDNumber: UITextField!
    @IBOutlet weak var imgOfUploading: UIImageView!
    let photoPicker = PhotoPicker()
    var cover_image: UIImage?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizerforDp = UITapGestureRecognizer(target:self, action:#selector(GSUploadInfo.imageTappedForDp(img:)))
        imgOfUploading.isUserInteractionEnabled = true
        imgOfUploading.addGestureRecognizer(tapGestureRecognizerforDp)
        // Do any additional setup after loading the view.
    }
    
    @objc func imageTappedForDp(img: AnyObject)
    {
        photoPicker.pick(allowsEditing: false, pickerSourceType: .CameraAndPhotoLibrary, controller: self) {[weak self] (orignal, edited) in
            
            self!.imgOfUploading.image = orignal
//            let cgFloat: CGFloat = self.imgeOfUser.frame.size.width/2.0
//            let someFloat = Float(cgFloat)
//            WAShareHelper.setViewCornerRadius(self.imgeOfUser, radius: CGFloat(someFloat))
            self!.cover_image = orignal
            
        }
        
    }

    
    @IBAction func btnBack_Pressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnContinue_Pressed(_ sender: UIButton) {
        pushToViewControllerWithStoryboardID(storyboardId: VCIdentifier.KAddCardInfo)

//        let vc = self.storyboard?.instantiateViewController(withIdentifier: VCIdentifier.KAddCardInfo) as? GSAddCardInfoVC
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
