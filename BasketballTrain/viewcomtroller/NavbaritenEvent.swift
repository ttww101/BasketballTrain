//
//  NavbaritemVC.swift
//  BasketballTrain
//
//  Created by Apple on 2019/12/5.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import MessageUI

protocol NavbaritenEvent {
    func loginPressed()
    func logoutPressed()
}

class NavbaritemVC: UIViewController {
    
    var event: NavbaritenEvent?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingItem()
    }
    
    func settingItem() {
        if LCManager.shared.objectId != "" {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登出", style: .plain, target: self, action: #selector(logout(sender:)))
        } else {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登入", style: .plain, target: self, action: #selector(login(sender:)))
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "messenger"), style: .plain, target: self, action: #selector(messengerPressed(sender:)))
    }
    
    @objc func logout(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "", message: "是否确定登出", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "确定", style: .default) {[weak self] (_) in
            LCManager.shared.objectId = ""
            self?.settingItem()
            self?.event?.logoutPressed()
        }
        
        let alertAction2 = UIAlertAction(title: "取消", style: .cancel) { (_) in
            
        }
        
        alert.addAction(alertAction)
        alert.addAction(alertAction2)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func login(sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Begin", bundle: nil)
        if let desVC = storyboard.instantiateInitialViewController() {
            self.present(desVC, animated: true, completion: nil)
            settingItem()
            event?.loginPressed()
        }
    }
    
    @objc func messengerPressed(sender: UIBarButtonItem) {
        sendEmail()
    }

}

extension NavbaritemVC: MFMailComposeViewControllerDelegate {
    
    func configureMailController() -> MFMailComposeViewController {
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        mailComposerVC.setToRecipients(["zhxinlian@yahoo.com"])
        mailComposerVC.setSubject("App意见回馈")
        mailComposerVC.title = "意见回馈"
        
        return mailComposerVC
        
    }
    
    func sendEmail() {
        
        let mailComposeViewController = configureMailController()
        
        if MFMailComposeViewController.canSendMail() {
            
            self.present(mailComposeViewController, animated: true, completion: nil)
            
        }
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
    
}
