//
//  ViewController.swift
//  UIKitLes7_SegmentControl
//
//  Created by Diana on 24/08/2022.
//

import UIKit


class ViewController: UIViewController {
    
    var adidasImage = UIImageView()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var enterButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .darkGray
        title = "ADIDAS"
        configureAdidasImage()
        congigureTextFields()
        configureEnterButton()
    }
    
    private func configureAdidasImage() {
        let image = UIImage(named: "adidas")
        adidasImage.image = image
        adidasImage.frame.size = CGSize(width: view.frame.width - 10,
                                        height: view.frame.width - 10)
        adidasImage.frame.origin = CGPoint(x: view.frame.midX - adidasImage.frame.width / 2,
                                           y: view.frame.minY + 40)
        adidasImage.contentMode = .scaleAspectFit
        view.addSubview(adidasImage)
    }
    
    private func congigureTextFields() {
        loginTextField = createTextField(placeholder: "Login")
        loginTextField.frame.origin = CGPoint(x: view.frame.midX - loginTextField.frame.width / 2,
                                              y: adidasImage.frame.maxY + 30)
        self.loginTextField.addTarget(self, action: #selector(loginAndPasswordChange), for: .editingChanged)
        
        passwordTextField = createTextField(placeholder: "Password")
        passwordTextField.frame.origin = CGPoint(x: view.frame.midX - passwordTextField.frame.width / 2,
                                                 y: loginTextField.frame.maxY + 20)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(loginAndPasswordChange), for: .editingChanged)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
    }
    
    private func createTextField(placeholder text: String) -> UITextField {
        let textField = UITextField()
        textField.frame.size = CGSize(width: view.frame.width / 2,
                                      height: 30)
        textField.placeholder = text
        textField.backgroundColor = .systemGray6
        return textField
    }
    
    private func configureEnterButton () {
        enterButton = UIButton()
        enterButton.frame.size = CGSize(width: view.frame.width / 3, height: 40)
        enterButton.frame.origin = CGPoint(x: view.frame.midX - enterButton.frame.width / 2,
                                           y: passwordTextField.frame.maxY + 40)
        enterButton.setTitle("Enter", for: .normal)
        enterButton.backgroundColor = .lightGray
        enterButton.addTarget(self, action: #selector(pressEnter), for: .touchUpInside)
        enterButton.isHidden = true
        view.addSubview(enterButton)
    }
    
    @objc private func loginAndPasswordChange() {
        if (loginTextField.text?.contains("@"))! && loginTextField.text?.count ?? 0 > 5   {
            if passwordTextField.text?.count ?? 0 > 5 {
                enterButton.isHidden = false
            }
        } else {
            enterButton.isHidden = true
        }
    }
    
    @objc private func pressEnter() {
        let shopViewController = ShopViewController()
        shopViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(shopViewController, animated: true)
    }
}





