//
//  InfoDetailVC.swift
//  BasketballTrain
//
//  Created by Apple on 2019/11/29.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import WebKit

class InfoDetailVC: UIViewController, Loadable {
    @IBOutlet weak var infoWebView: WKWebView!
    @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    
    @IBOutlet weak var titleInfo: UILabel!
    @IBOutlet weak var authorInfo: UILabel!
    @IBOutlet weak var createdInfo: UILabel!
    
    var model: InfoDetailModel?
    
    var infoData: Info!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoWebView.scrollView.isScrollEnabled = false
        infoWebView.navigationDelegate = self
        if let url = URL(string: "http://54.201.93.35:8078/api/getArticInfo") {
            var request = URLRequest(url: url)
            request.httpBody = try! JSONSerialization.data(withJSONObject: ["id":infoData.id], options: JSONSerialization.WritingOptions())
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTask(with: request) {(data, response, error) in
                if error == nil {
                    DispatchQueue.main.async(execute: {
                        guard let data = data else { return }
                        let decoder = JSONDecoder()
                        self.model = try! decoder.decode(InfoDetailModel.self, from: data)
                        if self.model?.code == "success" {
                            self.titleInfo.text = self.model?.data.title
                            self.titleInfo.adjustsFontSizeToFitWidth = true
                            self.authorInfo.text = "From:" + self.model!.data.author + " " + self.model!.data.resource
                            self.authorInfo.adjustsFontSizeToFitWidth = true
                            self.createdInfo.text = self.model!.data.createdAt
                            var s = self.model!.data.content
                            s = s.replace(target: "data-src", withString: "src")
                            self.infoWebView.loadHTMLString(s, baseURL: nil)
                        }
                        self.stopLoading()
                    })
                }
            }.resume()
        }
        // Do any additional setup after loading the view.
    }

}

extension InfoDetailVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        let strjs = "let pTag = document.querySelectorAll('p,span');for (let i =0; i<pTag.length; i++) pTag[i].style.fontSize = 36;"
        webView.evaluateJavaScript(strjs) {[weak self] (_, _) in
            guard let self = self else { return }
            webView.evaluateJavaScript("document.body.scrollLeft = 0;", completionHandler: nil)
            let h = webView.scrollView.contentSize.height
            self.scrollHeight.constant = h + 107
        }
    }
}
