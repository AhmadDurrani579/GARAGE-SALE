//
//  GSSplashVC.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 23/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

class GSSplashVC: UIViewController {
    
    override func loadView() {
        super.loadView()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: VCIdentifier.kMainTutorialVC) as? GSMainTutorialVC
//            self.navigationController?.pushViewController(vc!, animated: true)
            
            self.pushToViewControllerWithStoryboardID(storyboardId: VCIdentifier.kMainTutorialVC)

            //        let idOfUser = UserDefaults.standard.integer(forKey: "id")
            
            //        if idOfUser == 0 {
        })

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        configureSizeOfViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        } else {
//            verifyAutoLogin()
//
    }
    



}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
}
