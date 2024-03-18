//
//  TablePhoneViewController.swift
//  URLSessionProject
//
//  Created by WEMA on 16/01/2024.
//

import UIKit

class TablePhoneViewController: UIViewController {
     var data: [PhoneObj]?
    //var phoneModel: PhoneModel?
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.register(UINib(nibName: "TablePhoneTableViewCell", bundle: nil), forCellReuseIdentifier: "TablePhoneTableViewCell")
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        fetchPhones()
    }
    func fetchPhones() {
        //let urlSession  = URLSession.shared
        let networkServiceOne = NetworkServiceOne()
        networkServiceOne.fetch(url: URL(string: "https://dummyjson.com/products")!) {
            [weak self] response in
            
                
            switch response {
            case .success(let phoneModel):
                
                print("The response is \(phoneModel?.products)")
//                
//                if let product = phoneModel?.products {
//                    self?.data = product
                    DispatchQueue.main.async { [weak self] in
                        //self?.myLabel.text = phoneModel?.products?.first?.title
                        //self?.phoneModel = phoneModel
                        self?.data = phoneModel?.products
                        self?.myTableView.reloadData()
                    }
            case .failure(let error):
                print("The error is \(error)")
            }
            
        }
    }
}

extension TablePhoneViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return phoneModel?.products?.count ?? 0
        data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TablePhoneTableViewCell", for: indexPath) as! TablePhoneTableViewCell
        //        if let phoneModel = phoneModel?.products?[indexPath.row]{
        //            if let title = phoneModel.title{
        //                cell.tablePhoneLabel.text = title
        //            }else{
        //                cell.tablePhoneLabel.text = "Unknow Title"
        //            }
        //        }
        //
        //phoneModel = data?[indexPath.row]
        let phoneObj = data?[indexPath.item]
        //cell.tablePhoneLabel.text = phoneModel.title
        cell.updateCell(with: phoneObj)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}


