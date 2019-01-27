//
//  GSSelectVC.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 23/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

class GSSelectVC: UIViewController {
    @IBOutlet weak var btnSignIn : UIButton!
    @IBOutlet weak var btnSignUp : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSignIn.layer.shadowOpacity = 0.5
        btnSignIn.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        btnSignIn.layer.shadowRadius = 5.0
        btnSignIn.layer.shadowColor = UIColor(red: 102/255.0 , green: 114/255.0 , blue: 228/255.0 , alpha: 1.0).cgColor

        btnSignUp.layer.shadowOpacity = 0.5
        btnSignUp.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        btnSignUp.layer.shadowRadius = 5.0
        btnSignUp.layer.shadowColor = UIColor(red: 157/255.0 , green: 126/255.0 , blue: 251/255.0 , alpha: 1.0).cgColor

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//    }

    
    
    @IBAction func btnLogin_Pressed(_ sender: UIButton) {
        pushToViewControllerWithStoryboardID(storyboardId: VCIdentifier.KLoginViewController)

//        let vc = self.storyboard?.instantiateViewController(withIdentifier: VCIdentifier.KLoginViewController) as? GSLoginVC
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
   
    @IBAction func btnSignUp_Pressed(_ sender: UIButton) {
        pushToViewControllerWithStoryboardID(storyboardId: VCIdentifier.KSignUpSelectionViewController)

//        let vc = self.storyboard?.instantiateViewController(withIdentifier: VCIdentifier.KSignUpSelectionViewController) as? GSSignUpSelectionVC
//        self.navigationController?.pushViewController(vc!, animated: true)
    }


}
