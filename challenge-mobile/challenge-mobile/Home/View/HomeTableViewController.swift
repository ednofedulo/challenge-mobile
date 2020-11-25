//
//  HomeTableViewController.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 24/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var viewModel:HomeViewModel?
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.viewModel?.fetchData()
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.title = "MEU PERFIL"
        self.registerCells()
    }
    
    private func registerCells(){
        tableView.register(UserInfoTableViewCell.self, forCellReuseIdentifier: "userInfoCell")
        tableView.register(OrdersOverviewTableViewCell.self, forCellReuseIdentifier: "ordersOverviewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 2
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let viewModel = self.viewModel, let model = viewModel.model else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell", for: indexPath) as! UserInfoTableViewCell
            cell.setup(avatarUrl: model.avatar_url!, name: model.fullname!, city: model.city!, state: model.state_abbr!)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ordersOverviewCell", for: indexPath) as! OrdersOverviewTableViewCell
            cell.setup(orders: model.orders!)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as UITableViewCell
            cell.textLabel?.text = indexPath.row == 0 ? "Minhas Assinaturas" : "Sair"
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 1 ? "Status de Acompanhamento" : nil
    }
}


extension HomeTableViewController:HomeViewModelViewDelegate {
    func didFetchDataFromAPIError(sender: HomeViewModel) {
        self.showAlertMessage(title: "Atenção", msg: "Ocorreu um problema ao obter as informações.")
    }
    
    func didFetchDataFromAPISuccess(sender: HomeViewModel) {
        self.tableView.reloadData()
    }
}
