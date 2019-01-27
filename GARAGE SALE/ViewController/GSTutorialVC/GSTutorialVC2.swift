//
//  GSTutorialVC2.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 23/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

class GSTutorialVC2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNext_Pressed(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: VCIdentifier.kSELECTVC) as? GSSelectVC
        let navigationController = UINavigationController(rootViewController: vc!)
        navigationController.setNavigationBarHidden(true, animated: true)
        self.present(navigationController, animated: true) {
            
        }
        
    }

}
