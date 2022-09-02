//
//  ShopViewController.swift
//  UIKitLes7_SegmentControl
//
//  Created by Diana on 26/08/2022.
//

import UIKit


class ShopViewController: UIViewController {
    
    let adidasData = AdidasBoots()
    
    var segmentControl = UISegmentedControl()
    var imageView = UIImageView()
    var priceLabel = UILabel()
    var nameLabel = UILabel()
    
    var namesForSection = [String]()
    static var segmentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        title = "SHOP"
        configureImageView()
        configureSegmentControl()
        configureName()
        configurePrice()
    }
    
    private func configureSegmentControl() {
        adidasData.boots.forEach { obj in
            namesForSection.append(obj.name)
        }
        
        segmentControl = UISegmentedControl(items: namesForSection)
        segmentControl.frame.size = CGSize(width: view.frame.width - 20, height: 30)
        segmentControl.frame.origin = CGPoint(x: view.frame.midX - segmentControl.frame.width / 2,
                                              y: imageView.frame.maxY + 20)
        view.addSubview(segmentControl)
        
        segmentControl.addTarget(self, action: #selector(changeImage(target:)), for: .valueChanged)
    }
    
    private func configureImageView() {
        imageView.frame.size = CGSize(width: 400, height: 400)
        imageView.frame.origin = CGPoint(x: view.frame.midX - imageView.frame.width / 2,
                                         y: view.frame.minY + 40)
        imageView.image = UIImage(named: adidasData.boots.first?.images.first ?? "")
        imageView.contentMode = .scaleAspectFit
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showBootAdidasViewController))
        
        self.imageView.isUserInteractionEnabled = true
        self.imageView.addGestureRecognizer(gesture)
        view.addSubview(imageView)
    }
    
    private func configureName() {
        nameLabel.frame.size = CGSize(width: 120, height: 50)
        nameLabel.frame.origin = CGPoint(x: segmentControl.frame.minX,
                                         y: segmentControl.frame.maxY + 20)
        nameLabel.textAlignment = .natural
        nameLabel.textColor = .lightGray
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.text = "Adidas   " + adidasData.boots[ShopViewController.segmentIndex].name
        view.addSubview(nameLabel)
    }
    
    private func configurePrice() {
        priceLabel.frame.size = CGSize(width: 150, height: 50)
        priceLabel.frame.origin = CGPoint(x: segmentControl.frame.maxX - priceLabel.frame.width + 10,
                                          y: segmentControl.frame.maxY + 20)
        priceLabel.textAlignment = .center
        priceLabel.textColor = .orange
        priceLabel.font = .systemFont(ofSize: 25)
        priceLabel.text = String(adidasData.boots[ShopViewController.segmentIndex].price) + " pln"
        view.addSubview(priceLabel)
    }
    
    @objc
    private func changeImage(target: UISegmentedControl) {
        if target == self.segmentControl {
            ShopViewController.segmentIndex = target.selectedSegmentIndex
            
            imageView.image = UIImage(named: adidasData.boots[ShopViewController.segmentIndex].images.first ?? "")
            nameLabel.text = "Adidas   " + adidasData.boots[ShopViewController.segmentIndex].name
            priceLabel.text = String(adidasData.boots[ShopViewController.segmentIndex].price) + " pln"
        }
    }
    
    @objc private func showBootAdidasViewController() {
        let bootViewController = BootAdidasViewController()
        bootViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(bootViewController, animated: true)
    }
}
