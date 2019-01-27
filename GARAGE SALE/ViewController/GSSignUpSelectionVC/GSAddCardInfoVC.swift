//
//  GSAddCardInfoVC.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 24/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit

class GSAddCardInfoVC: UIViewController {

    @IBOutlet weak var txtCardNum: UITextField!
    
    @IBOutlet weak var txtCardHolderName: UITextField!
    
    @IBOutlet weak var txtExpiryDate: UITextField!
    
    @IBOutlet weak var txtCvvNum: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBack_Pressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSkip_Pressed(_ sender: UIButton) {
        
    }
    
    @IBAction func btnAddCard_Pressed(_ sender: UIButton) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: VCIdentifier.KAllowLocationViewController) as? GSAllowLocationVC
//
//        self.navigationController?.pushViewController(vc!, animated: true)
        pushToViewControllerWithStoryboardID(storyboardId: VCIdentifier.KAllowLocationViewController)

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
