//
//  NewsVC.swift
//  BasketballTrain
//
//  Created by Apple on 2019/11/27.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


class NewsVC: NavbaritemVC, UIScrollViewDelegate {
    @IBOutlet weak var indicatorLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var FNewsBtn: UIButton!
    @IBOutlet weak var PNewsBtn: UIButton!
    
    var titleBtns: [UIButton] {
        return [FNewsBtn, PNewsBtn]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changePagePressed(_ sender: UIButton) {
        for btn in titleBtns {
            
            btn.isSelected = false
            
        }
        
        sender.isSelected = true
        
        moveIndicatorView(toPage: sender.tag)
        
    }
    
    private func moveIndicatorView(toPage: Int) {
        
        let screenWidth  = UIScreen.main.bounds.width
        
        indicatorLeadingConstraint.constant = (CGFloat(toPage) * screenWidth - 16) / 2
        
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            
            self?.scrollView.contentOffset.x = CGFloat(toPage) * screenWidth
            
            self?.view.layoutIfNeeded()
            
        })
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let screenWidth  = UIScreen.main.bounds.width
        
        indicatorLeadingConstraint.constant = scrollView.contentOffset.x * ((screenWidth - 16) / (screenWidth * 2))
        
        let temp = Double(scrollView.contentOffset.x / screenWidth)
        
        let number = lround(temp)
        
        for btn in titleBtns {
            
            btn.isSelected = false
            
        }
        
        titleBtns[number].isSelected = true
        
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
            
            self?.view.layoutIfNeeded()
            
        })
        
    }
    

}
