//
//  BannerView.swift
//  challenge-mobile
//
//  Created by Edno Fedulo on 25/11/20.
//  Copyright © 2020 Edno Fedulo. All rights reserved.
//

import UIKit

class BannerView: UIView {
    
    var banners:[URL]?
    
    private var currentPage:Int {
        return Int(self.scrollView.contentOffset.x / self.scrollView.frame.size.width)
    }
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.isUserInteractionEnabled = false
        return pageControl
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.clipsToBounds = false
        return scrollView
    }()
    
    lazy var innerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()

    init(){
        super.init(frame: CGRect.zero)
        addSubviews()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setupConstraints()
    }
    
    private func addSubviews(){
        self.addSubview(scrollView)
        self.scrollView.addSubview(innerStackView)
        self.addSubview(pageControl)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.innerStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.innerStackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.innerStackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.innerStackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            self.pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.pageControl.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -5)
        ])
    }
    
    private func createBanner(with imageUrl: URL) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        
        view.widthAnchor.constraint(equalToConstant: scrollView.frame.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: scrollView.frame.height).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFit
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: imageUrl)
        
        
        return view
    }
    
    
    func load(){
        if let banners = banners {
            self.pageControl.numberOfPages = banners.count
            
            for banner in banners {
                let bannerView = createBanner(with: banner)
                innerStackView.addArrangedSubview(bannerView)
            }
        }
    }
    
    private func setupViews(){
        scrollView.delegate = self
        self.backgroundColor = .secondarySystemBackground
    }
    
    private func updatePageControl(){
        UIView.animate(withDuration: 0.3) {
            self.pageControl.currentPage = self.currentPage
        }
    }
}

extension BannerView :UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        updatePageControl()
    }
}

