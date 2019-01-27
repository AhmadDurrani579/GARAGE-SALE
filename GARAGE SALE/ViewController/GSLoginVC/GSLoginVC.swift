//
//  GSLoginVC.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 23/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class GSLoginVC: UIViewController  {
    
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    var presenter: RegistrationPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtEmail.setLeftPaddingPoints(10)
        txtPassword.setLeftPaddingPoints(10)
        txtEmail.text = "ahmaddurranitrg@gmail.com"
        txtPassword.text = "123456789"
        presenter = RegistrationPresenter(delegate: self)
    }
    
    @IBAction func btnBack_Pressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnLogin_Pressed(_ sender: UIButton) {
        self.presenter?.signIn(email: txtEmail.text!, password: txtPassword.text!)

    }
    
   
    
    @IBAction func btnForgotPassword_Pressed(_ sender: UIButton) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: VCIdentifier.kForgotPasswordController) as? GSForgotPasswordVC
//        self.navigationController?.pushViewController(vc!, animated: true)
        
        pushToViewControllerWithStoryboardID(storyboardId:VCIdentifier.kForgotPasswordController )
    }

}

extension GSLoginVC: RegistrationDelegate {
    func showProgress(){
        
    }
    func hideProgress(){
        
    }
    func registrationDidSucceed(){
        
//                        let story = UIStoryboard(name: "Home", bundle: nil)
//                        let vc = story.instantiateViewController(withIdentifier: VCIdentifier.kMainTabbarController)
//                        let nav = UINavigationController(rootViewController: vc)
//                        nav.isNavigationBarHidden = true
//                        UIApplication.shared.keyWindow?.rootViewController = nav

        var deviceToken =  UserDefaults.standard.value(forKey: "device_token") as? String

        if deviceToken == nil {
            deviceToken = "-1"
        }
        let loginParam =      [ kEmail         : txtEmail.text!,
                                kPassword      : txtPassword.text!
//                                kDeviceId      : deviceToken! ,
//                                kDeviceType    : "iOS"

                                ] as [String : Any]
        self.showAnimation()
        WebServiceManager.postWithOutHeader(params:loginParam as Dictionary<String, AnyObject> , serviceName: LOGIN, isLoaderShow: true, serviceType: "Login", modelType: UserResponse.self, success: { [weak self] (response) in
            let responseObj = response as! UserResponse
            self!.dismissLoadingView()
            if responseObj.status == true {
                
                UserDefaults.standard.set(responseObj.data?.user?.token , forKey: "user_token")

                let story = UIStoryboard(name: "Home", bundle: nil)
                let vc = story.instantiateViewController(withIdentifier: VCIdentifier.kMainTabbarController)
                let nav = UINavigationController(rootViewController: vc)
                nav.isNavigationBarHidden = true
                UIApplication.shared.keyWindow?.rootViewController = nav
            }
            else {
                self!.showAlert(title: KMessageTitle , message: responseObj.message!, controller: self)
            }
        }, fail: { (error) in
            self.dismissLoadingView()

        }, showHUD: true)
    }
    
    func registrationDidFailed(message: String){
        self.showAlert(title: KMessageTitle , message: message, controller: self)
    }
}

extension UIViewController: NVActivityIndicatorViewable  {
    func  showAnimation() {
        let size = CGSize(width: 80, height: 80)
        startAnimating(size, message: "", messageFont: nil, type:.ballClipRotatePulse , color: UIColor.white, padding: CGFloat(70), displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: nil, textColor: nil, fadeInAnimation: nil)
    }
    
    func dismissLoadingView() {
        stopAnimating(nil)
    }
}
