//
//  GSMainTutorialVC.swift
//  GARAGE SALE
//
//  Created by Ahmed Durrani on 23/01/2019.
//  Copyright © 2019 TeachEase Solution. All rights reserved.
//

import UIKit
import liquid_swipe

class ColoredController: UIViewController {
    var viewColor: UIColor = .white {
        didSet {
            viewIfLoaded?.backgroundColor = viewColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = viewColor
    }
}

class GSMainTutorialVC: LiquidSwipeContainerController , LiquidSwipeContainerDataSource {
    
    var viewControllers: [UIViewController] = {
        let firstPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: VCIdentifier.kMainTutorialVC1)
        let secondPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: VCIdentifier.kMainTutorialVC2)
        let thirdPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: VCIdentifier.kMainTutorialVC3)
        
        var controllers: [UIViewController] = [firstPageVC, secondPageVC , thirdPageVC]
        
        return controllers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = self

        // Do any additional setup after loading the view.
    }
    
    func numberOfControllersInLiquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController) -> Int {
        
        return viewControllers.count
    }
    
    func liquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController, viewControllerAtIndex index: Int) -> UIViewController {
//        liquidSwipeContainer.hidesBottomBarWhenPushed = true
//        liquidSwipeContainer.removeFromParent()
        return viewControllers[index]
    }
   
}

