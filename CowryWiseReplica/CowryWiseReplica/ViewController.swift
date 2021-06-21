//
//  ViewController.swift
//  CowryWiseReplica
//
//  Created by Decagon on 07/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
    }
    
    @objc func buttonClicked(sender : UIButton){
                let SecondPage = SecondPageVIewController()
        SecondPage.modalPresentationStyle = .fullScreen
            SecondPage.email = emailField.text!
                self.navigationController?.pushViewController(SecondPage, animated: true)
        //        self.present(newViewController, animated: true, completion: nil)
            }
    
    
    
    @objc func buttonClickedPage3(sender : UIButton){
                let thirdPage = SignInViewViewController()
        thirdPage.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(thirdPage, animated: true)
            }

    
    
    @objc func handleLogin(){
        loginAction?()
    }
    
    @objc func loginPressed(){
        print("Login Pressed ")
    }
    
    var loginAction:(() -> Void)?
   
    var cowryWiseView:UIView!
    var cowryWiseLogo: UIImageView!
    var getYourMoneyLabel:UILabel!
    var emailField:UITextField!
    var typeYourEmailLabel:UILabel!
    var getStartedButton: UIButton!
    var gotAnAccount:UILabel!
    var signInButton:UIButton!
    var thirdView:UIView!
    
    
    
    override func loadView() {
    
        view = UIView()
        
        cowryWiseView = UIView()
        cowryWiseView.translatesAutoresizingMaskIntoConstraints = false
        cowryWiseView.backgroundColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        view.addSubview(cowryWiseView)
        
        thirdView = UIView()
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        thirdView.backgroundColor = .white
        view.addSubview(thirdView)
        
        cowryWiseLogo = {
            let theImageView = UIImageView()
            theImageView.image = UIImage(named: "logoW.png")
            theImageView.translatesAutoresizingMaskIntoConstraints = false
            return theImageView
        }()
        cowryWiseView.addSubview(cowryWiseLogo)
        
        
        getYourMoneyLabel = UILabel()
        getYourMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
        getYourMoneyLabel.text = "Let's get your money working"
        getYourMoneyLabel.font = UIFont.systemFont(ofSize: 25)
        getYourMoneyLabel.textColor = #colorLiteral(red: 0.09365727752, green: 0.2302636802, blue: 0.4337103665, alpha: 1)
        getYourMoneyLabel.textAlignment  = .left
        view.addSubview(getYourMoneyLabel)
        
        typeYourEmailLabel = UILabel()
        typeYourEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        typeYourEmailLabel.text = "Type in your email"
        typeYourEmailLabel.font = UIFont.systemFont(ofSize: 15)
        typeYourEmailLabel.textColor = #colorLiteral(red: 0.6334012747, green: 0.6889647245, blue: 0.7680160999, alpha: 1)
        typeYourEmailLabel.textAlignment  = .left
        view.addSubview(typeYourEmailLabel)
        
        
        emailField = UITextField()
        emailField.translatesAutoresizingMaskIntoConstraints = false
        
        emailField.textAlignment = .left
        emailField.font = UIFont.systemFont(ofSize: 20)
        emailField.placeholder = "                      "
        emailField.isUserInteractionEnabled = true
        emailField.keyboardType = UIKeyboardType.default
        emailField.returnKeyType = UIReturnKeyType.default
        emailField.addLine(position: .bottom, color: .gray, width: 0.75)
        view.addSubview(emailField)
        
        getStartedButton = UIButton()
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.setTitle("Get Started", for:.normal)
        getStartedButton.setTitleColor(UIColor.white, for: .normal)
        getStartedButton.backgroundColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        getStartedButton.layer.cornerRadius = 5.0
       getStartedButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
       // getStartedButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)

        view.addSubview(getStartedButton)
        
        
        gotAnAccount = UILabel()
        gotAnAccount.text = "Got an account?"
        gotAnAccount.translatesAutoresizingMaskIntoConstraints = false
        gotAnAccount.font = UIFont.systemFont(ofSize: 15)
        gotAnAccount.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        gotAnAccount.textAlignment  = .center
        view.addSubview(gotAnAccount)
        
        signInButton = UIButton()
        signInButton.setTitle("Sign in", for:.normal)
        signInButton.setTitleColor(UIColor.blue, for: .normal)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        signInButton.layer.cornerRadius = 5.0
        signInButton.addTarget(self, action: #selector(buttonClickedPage3), for: .touchUpInside)
        view.addSubview(signInButton)
  
        
        NSLayoutConstraint.activate([
            
            cowryWiseView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: -20),
            cowryWiseView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1),
            cowryWiseView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.4),
            
            thirdView.topAnchor.constraint(equalTo: cowryWiseView.bottomAnchor, constant: 0),
            thirdView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1),
            thirdView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.6),
            
            
            
            cowryWiseLogo.widthAnchor.constraint(equalToConstant: 250),
            cowryWiseLogo.heightAnchor.constraint(equalToConstant: 50),
            cowryWiseLogo.centerXAnchor.constraint(equalTo: cowryWiseView.centerXAnchor),
            cowryWiseLogo.centerYAnchor.constraint(equalTo: cowryWiseView.centerYAnchor),
            
            
            
            getYourMoneyLabel.topAnchor.constraint(equalTo: cowryWiseView.layoutMarginsGuide.bottomAnchor, constant: 50),
            getYourMoneyLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor ),
            
            
            typeYourEmailLabel.topAnchor.constraint(equalTo: getYourMoneyLabel.layoutMarginsGuide.bottomAnchor,constant: 20),
            typeYourEmailLabel.leadingAnchor.constraint(equalTo: getYourMoneyLabel.leadingAnchor),
            
            emailField.topAnchor.constraint(equalTo: typeYourEmailLabel.layoutMarginsGuide.bottomAnchor,constant: 20),
            emailField.leadingAnchor.constraint(equalTo: typeYourEmailLabel.leadingAnchor),
            emailField.widthAnchor.constraint(equalToConstant: 370),
            
            getStartedButton.topAnchor.constraint(equalTo: emailField.layoutMarginsGuide.bottomAnchor, constant: 40),
                       getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                       getStartedButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.90),
                       getStartedButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
            
            gotAnAccount.topAnchor.constraint(equalTo: getStartedButton.layoutMarginsGuide.bottomAnchor, constant: 20),
            gotAnAccount.leadingAnchor.constraint(equalTo: getStartedButton.leadingAnchor,constant: 100),
           
            signInButton.topAnchor.constraint(equalTo: getStartedButton.layoutMarginsGuide.bottomAnchor, constant: 13.5),
            signInButton.leadingAnchor.constraint(equalTo: gotAnAccount.trailingAnchor, constant: 1.5)
           
            
            
            
        ])
        
    }
    
    
    
}

enum LinePosition {
    case top
    case bottom
}

extension UIView {
    func addLine(position: LinePosition, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)

        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))

        switch position {
        case .top:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .bottom:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        }
    }
}


