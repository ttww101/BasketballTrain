//
//  InfoVC.swift
//  BasketballTrain
//
//  Created by Apple on 2019/11/29.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class InfoVC: NavbaritemVC, Loadable {
    private let cellIdenfifier1 = String(describing: InfoCell.self)
    
    @IBOutlet weak var infoTable: UITableView!
    
    var model: InfoModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTable.estimatedRowHeight = 4
        infoTable.rowHeight = UITableView.automaticDimension
        infoTable.isHidden = true
        self.startLoading(at: view.center, onTopOf: view)
        if let url = URL(string: "http://54.201.93.35:8078/api/getArticleList") {
            var request = URLRequest(url: url)
            request.httpBody = try! JSONSerialization.data(withJSONObject: ["cid":7], options: JSONSerialization.WritingOptions())
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTask(with: request) {(data, response, error) in
                if error == nil {
                    DispatchQueue.main.async(execute: {
                        guard let data = data else { return }
                        let decoder = JSONDecoder()
                        self.model = try! decoder.decode(InfoModel.self, from: data)
                        if self.model?.code == "success" {
                            self.infoTable.reloadData()
                            self.infoTable.isHidden = false
                        }
                        self.stopLoading()
                    })
                }
            }.resume()
        }
        // Do any additional setup after loading the view.
    }

}

extension InfoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.data.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = model else { return InfoCell() }
        guard let cell = infoTable.dequeueReusableCell(withIdentifier:
            cellIdenfifier1) as? InfoCell
            else {return InfoCell()}
        cell.setupInfo(model.data.data[indexPath.row])
        cell.imgfinsh = {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        return cell
    }
}

extension InfoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = model?.data.data[indexPath.row]
        let profileStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let desVC = profileStoryboard.instantiateViewController(withIdentifier: "InfoDetailVC")
        
        guard let infoDetailVC = desVC as? InfoDetailVC else { return }
        
        infoDetailVC.infoData = data!
        
//        let cell = tableView.cellForRow(at: indexPath)
//        cell?.setSelected(false, animated: false)
        infoTable.deselectRow(at: indexPath, animated: false)
        self.navigationController?.pushViewController(infoDetailVC, animated: true)
    }
}
