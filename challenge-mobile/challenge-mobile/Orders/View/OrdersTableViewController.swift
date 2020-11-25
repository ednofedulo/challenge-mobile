//
//  OrdersTableViewController.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 25/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    var viewModel:OrdersViewModel?
    
    init(viewModel:OrdersViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        self.title = viewModel?.screenTitle
        tableView.tableFooterView = UIView()
    }
    
    func registerCells(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "orderCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.orders?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath)
        let order = viewModel?.getOrder(at: indexPath.row)
        cell.textLabel?.text = "#\(order!.order_id!) \(order!.submodel_name!)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.didSelectOrder(at: indexPath.row)
    }

}
