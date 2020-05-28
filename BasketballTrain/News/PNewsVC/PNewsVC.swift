//
//  PNewsVC.swift
//  BasketballTrain
//
//  Created by Apple on 2019/11/28.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PNewsVC: UIViewController, Loadable {
    private let cellIdenfifier1 = String(describing: PNewsCell.self)
    
    @IBOutlet weak var pNewsTable: UITableView!
    
    var model: NewsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        pNewsTable.isHidden = true
        self.startLoading(at: view.center, onTopOf: view)
        if let url = URL(string: "http://23451.net:9900/match/lq/list?type=2") {
            URLSession.shared.dataTask(with: url) { (data, response, errorMessage) in
                if errorMessage == nil {
                    DispatchQueue.main.async(execute: {
                        if data != nil {
                            do {
                                let decoder = JSONDecoder()
                                self.model = try? decoder.decode(NewsModel.self, from: data!)
                                if self.model?.success ?? false {
                                    self.pNewsTable.reloadData()
                                    self.pNewsTable.isHidden = false
                                    self.stopLoading()
                                }
                            } catch let error as NSError {
                                print(error.localizedDescription)
                            }
                        }
                    })
                }
                }.resume()
        }
        // Do any additional setup after loading the view.
    }

}

extension PNewsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = model else { return PNewsCell() }
        guard let cell = pNewsTable.dequeueReusableCell(withIdentifier:
            cellIdenfifier1) as? PNewsCell
            else {return PNewsCell()}
        cell.setupNews(model.data[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}

extension PNewsVC: UITableViewDelegate {
    
}
