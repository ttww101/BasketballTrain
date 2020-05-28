//
//  PrivacyVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/29/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

struct PrivacyModel {
    var title: String
    var privacy: String
}

class PrivacyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        LCManager.shared.getPrivacy {[weak self] (result, error) in
            guard let data = result else { self?.goBeginVC(); return}
            let pWebVC = PrivacyWebVC(titleP: data.title, urlP: [data.privacy])
            pWebVC.setCallBackByPrivacy(sdadf: "", efqev: "", pijfjgq: "", showOff: {
                self?.goBeginVC()
            })
            self?.present(pWebVC, animated: true, completion: nil)
        }
    }
    
    func goBeginVC() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        UIApplication.shared.keyWindow?.rootViewController = storyboard.instantiateInitialViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }

}
