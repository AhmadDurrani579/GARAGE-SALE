//
//  GSSignUpSelectionVC.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 24/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

class GSSignUpSelectionVC: UIViewController {
    @IBOutlet weak var btnEmail : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnEmail.layer.shadowOpacity = 0.5
        btnEmail.layer.shadowOffset = CGSize(width: 3.0, height: 2.0)
        btnEmail.layer.shadowRadius = 5.0
        btnEmail.layer.shadowColor = UIColor(red: 157/255.0 , green: 126/255.0 , blue: 251/255.0 , alpha: 1.0).cgColor
        

    }
    
    @IBAction func btnLogin_Pressed(_ sender: UIButton) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: VCIdentifier.KLoginViewController) as? GSLoginVC
//        self.navigationController?.pushViewController(vc!, animated: true)
        pushToViewControllerWithStoryboardID(storyboardId: VCIdentifier.KLoginViewController)

    }
    
    @IBAction func btnEmail_Pressed(_ sender: UIButton) {
        
        pushToViewControllerWithStoryboardID(storyboardId: VCIdentifier.KSignUpViewController)

//        let vc = self.storyboard?.instantiateViewController(withIdentifier: VCIdentifier.KSignUpViewController) as? GHSignUpVC
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func btnBack_Pressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }


}
