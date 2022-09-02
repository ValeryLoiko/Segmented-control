//
//  BootAdidasViewController.swift
//  UIKitLes7_SegmentControl
//
//  Created by Diana on 31/08/2022.
//

import UIKit


class BootAdidasViewController: UIViewController {
    
    let adidasBoots = AdidasBoots()
    
    var bootImage = UIImageView()
    var priceLabel = UILabel()
    var nameLabel = UILabel()
    var segmentControl = UISegmentedControl()
    
    var indexImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = adidasBoots.boots.first?.name
        view.backgroundColor = .darkGray
        
        configureImage()
        configurePriceLabel()
        configureNameLabel()
        configureSegmentControl()
    }
    
    private func configureImage() {
        bootImage.frame = CGRect(x: 0, y: 0, width: view.frame.width,
                                 height: view.frame.height / 2)
        bootImage.image = UIImage(named: adidasBoots.boots[ShopViewController.segmentIndex].images.first ?? "")
        bootImage.contentMode = .scaleAspectFit
        
        let rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(showNextImage(target:)))
        rightGesture.direction = .right
        
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(showNextImage(target:)))
        leftGesture.direction = .left
        
        bootImage.addGestureRecognizer(rightGesture)
        bootImage.addGestureRecognizer(leftGesture)
        bootImage.isUserInteractionEnabled = true
        view.addSubview(bootImage)
    }
    
    private func configurePriceLabel() {
        priceLabel.frame.size = CGSize(width: 150, height: 30)
        priceLabel.frame.origin = CGPoint(x: view.frame.maxX - priceLabel.frame.width + 30,
                                          y: bootImage.frame.maxY + 30)
        priceLabel.textAlignment = .left
        priceLabel.textColor = .orange
        priceLabel.font = .systemFont(ofSize: 25)
        priceLabel.text = String(adidasBoots.boots[ShopViewController.segmentIndex].price) + " pln"
        view.addSubview(priceLabel)
    }
    
    private func configureNameLabel() {
        nameLabel.frame.size = CGSize(width: 120, height: 30)
        nameLabel.frame.origin = CGPoint(x: view.frame.minX + 30,
                                         y: bootImage.frame.maxY + 30)
        nameLabel.textAlignment = .natural
        nameLabel.textColor = .lightGray
        nameLabel.font = .systemFont(ofSize: 25)
        nameLabel.text = String(adidasBoots.boots[ShopViewController.segmentIndex].name)
        view.addSubview(nameLabel)
    }
    
    private func configureSegmentControl() {
        segmentControl.insertSegment(withTitle: "", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "", at: 1, animated: true)
        segmentControl.insertSegment(withTitle: "", at: 2, animated: true)
        segmentControl.insertSegment(withTitle: "", at: 3, animated: true)
        
        segmentControl.frame.size = CGSize(width: 100, height: 15)
        segmentControl.frame.origin = CGPoint(x: view.frame.midX - segmentControl.frame.width / 2,
                                              y: bootImage.bounds.maxY - segmentControl.frame.height * 1.5)
        segmentControl.backgroundColor = .lightGray
        view.addSubview(segmentControl)
    }
    
    private func updateImage() {
        bootImage.image = UIImage(named: adidasBoots.boots[ShopViewController.segmentIndex].images[indexImage])
        segmentControl.selectedSegmentIndex = indexImage
    }
    
    @objc private func showNextImage(target: UISwipeGestureRecognizer) {
        switch target.direction{
        case .right:
            if indexImage == adidasBoots.boots[ShopViewController.segmentIndex].images.count - 1 {
                indexImage = 0
                updateImage()
            } else {
                indexImage += 1
                updateImage()
            }
        case.left:
            if indexImage == 0 {
                indexImage = adidasBoots.boots[ShopViewController.segmentIndex].images.count - 1
                updateImage()
            } else {
                indexImage -= 1
                updateImage()
            }
        default:
            print("jabosh")
        }
    }
}
