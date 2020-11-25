//
//  OrderDetailViewController.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 25/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    lazy var bannerView: BannerView = {
        let bannerView = BannerView()
        bannerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return bannerView
    }()
    
    lazy var detailsView:DetailsView = {
        let view = UINib(nibName: "DetailsView", bundle: nil).instantiate(withOwner: self, options: nil).first as! DetailsView
        view.heightAnchor.constraint(equalToConstant: 800).isActive = true
        return view
    }()
    
    var viewModel:OrderDetailViewModel?
    
    init(viewModel:OrderDetailViewModel) {
        self.viewModel = viewModel
        self.viewModel?.fetchData()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        addSubviews()
        
    }

    func addSubviews(){
        stackView.addArrangedSubview(bannerView)
        stackView.addArrangedSubview(detailsView)
    }

}

extension OrderDetailViewController: OrderDetailViewModelViewDelegate {
    func didFetchDataFromAPISuccess(sender: OrderDetailViewModel) {
        
        guard let viewModel = self.viewModel, let model = viewModel.model else { return }
        
        
        if let vehicleDetails = model.vehicle_details {
            bannerView.banners = vehicleDetails.image_url?.compactMap({
                URL(string:$0)
            })
            
            bannerView.load()
            
            self.title = "\(vehicleDetails.vehicle_model!) \(vehicleDetails.vehicle_brand!) \(vehicleDetails.vehicle_year!)"
        
        }
        
        detailsView.setup(orderDetails: model)
    }
    
    func didFetchDataFromAPIError(sender: OrderDetailViewModel) {
        self.showAlertMessage(title: "Atenção", msg: "Ocorreu um problema ao obter as informações.")
    }
}
