//
//  GSTutorialVC1.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 23/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

class GSTutorialVC1: UIViewController {
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func btnNext_Pressed(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: VCIdentifier.kSELECTVC) as? GSSelectVC
        let navigationController = UINavigationController(rootViewController: vc!)
        navigationController.setNavigationBarHidden(true, animated: true)
        self.present(navigationController, animated: true) {

        }

    }

}
