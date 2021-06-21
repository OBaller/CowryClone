//
//  SignInViewViewController.swift
//  CowryWiseReplica
//
//  Created by Decagon on 08/05/2021.
//

import UIKit

class SignInViewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func buttonClicked(){
                let profilePage = profileViewController()
        profilePage.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(profilePage, animated: true)
            }
    
    @objc func handleLogin(){
        loginAction?()
    }
    
    @objc func loginPressed(){
        guard let email = emailAddressTextField.text?.lowercased() else {return}
        guard  let password = passwordTextField.text  else {return}
        
        if email.isValidEmail == false && password == ""{
            let videoAlert = UIAlertController(title: "Login Error", message: "You have provided invalid email or password. Please check and try again", preferredStyle: .alert)
            videoAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(videoAlert, animated: true, completion: nil)

        }
        
       
       //NETWORK CALLS
        
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        func LoginPls() {
            let parameters = ["email": email, "password": password] as [String : Any]

            //create the url with URL
            let url = URL(string: "https://campaign.fundall.io/api/v1/login")!

            //create the session object
            let session = URLSession.shared

            //now create the URLRequest object using the url object
            var request = URLRequest(url: url)
            request.httpMethod = "POST" //set http method as POST

            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            } catch let error {
                print(error.localizedDescription)
            }

            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")

            //create dataTask using the session object to send data to the server
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

                guard error == nil else {
                    return
                }

                guard let data = data else {
                    return
                }

                do {
                    //create json object from data
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json)
                        
//                        if let httpResponse = response as? HTTPURLResponse {
//                           // print(" \(httpResponse.statusCode)")
//                            if httpResponse == "400" {
//
//                            }
//                        }
                        }
                } catch let error {
                    print(error.localizedDescription)
                }
            })
            task.resume()
            
        }
        
        
        if  email.isValidEmail == true && password != "" {
            LoginPls()
        }
        
        buttonClicked()
        
    }
    
    var loginAction:(() -> Void)?
    
    var cowryWiseView2:UIView!
    var cowryWiseLogo2: UIImageView!
    var jumpBackLabel:UILabel!
    var emailAddressLabel:UILabel!
    var emailAddressTextField : UITextField!
    var passWordLabel:UILabel!
    var passwordTextField:UITextField!
    var loginButton:UIButton!
    var forgotPassButton:UIButton!
    var thirdView:UIView!
    

   
    override func loadView() {
        
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        
        cowryWiseView2 = UIView()
        cowryWiseView2.translatesAutoresizingMaskIntoConstraints = false
        cowryWiseView2.backgroundColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        view.addSubview(cowryWiseView2)
        
        cowryWiseLogo2 = {
            let theImageView = UIImageView()
            theImageView.image = UIImage(named: "logoW.png")
            theImageView.translatesAutoresizingMaskIntoConstraints = false
            return theImageView
        }()
        cowryWiseView2.addSubview(cowryWiseLogo2)
        
        thirdView = UIView()
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        thirdView.backgroundColor = .white
        view.addSubview(thirdView)
        
        jumpBackLabel = UILabel()
        jumpBackLabel.translatesAutoresizingMaskIntoConstraints = false
        jumpBackLabel.text = "Jump right back in."
        jumpBackLabel.font = UIFont.systemFont(ofSize: 25)
        jumpBackLabel.textColor = #colorLiteral(red: 0.09365727752, green: 0.2302636802, blue: 0.4337103665, alpha: 1)
        jumpBackLabel.textAlignment  = .left
        thirdView.addSubview(jumpBackLabel)
        
        
        emailAddressLabel = UILabel()
        emailAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        emailAddressLabel.text = "Email Address"
        emailAddressLabel.font = UIFont.systemFont(ofSize: 15)
        emailAddressLabel.textColor = #colorLiteral(red: 0.6334012747, green: 0.6889647245, blue: 0.7680160999, alpha: 1)
        emailAddressLabel.textAlignment  = .left
        thirdView.addSubview(emailAddressLabel)
        
        emailAddressTextField = UITextField()
        
        emailAddressTextField.font = UIFont.systemFont(ofSize: 20)
        emailAddressTextField.placeholder = "                      "
        emailAddressTextField.isUserInteractionEnabled = true
        emailAddressTextField.keyboardType = UIKeyboardType.default
        emailAddressTextField.autocapitalizationType = .none
        emailAddressTextField.returnKeyType = UIReturnKeyType.default
        emailAddressTextField.translatesAutoresizingMaskIntoConstraints = false
        emailAddressTextField.addLine(position: .bottom, color: .gray, width: 0.5)
        thirdView.addSubview(emailAddressTextField)
        
        
        passWordLabel = UILabel()
        passWordLabel.translatesAutoresizingMaskIntoConstraints = false
        passWordLabel.text = "Password"
        passWordLabel.font = UIFont.systemFont(ofSize: 15)
        passWordLabel.textColor = #colorLiteral(red: 0.6334012747, green: 0.6889647245, blue: 0.7680160999, alpha: 1)
        passWordLabel.textAlignment  = .left
        thirdView.addSubview(passWordLabel)
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.addLine(position: .bottom, color:.gray, width: 0.5)
        passwordTextField.textAlignment = .left
        passwordTextField.font = UIFont.systemFont(ofSize: 20)
        passwordTextField.placeholder = "                    "
        passwordTextField.isUserInteractionEnabled = true
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.returnKeyType = UIReturnKeyType.default
        passwordTextField.isSecureTextEntry.toggle()
        thirdView.addSubview(passwordTextField)
        
        
        
        loginButton = UIButton()
        loginButton = UIButton()
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        loginButton.layer.cornerRadius = 5.0
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        //loginButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        thirdView.addSubview(loginButton)
        
//        func checkFields(_ sender: Any){
//            
//        }
        
        forgotPassButton = UIButton()
        forgotPassButton.setTitle("Forgot Password?", for:.normal)
//        forgotPassButton.setTitleColor(UIColor.blue, for: .normal)
        forgotPassButton.setTitleColor(#colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1), for: .normal)
        forgotPassButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPassButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        forgotPassButton.layer.cornerRadius = 5.0
        thirdView.addSubview(forgotPassButton)
  
        
        
        
        
        
        NSLayoutConstraint.activate([
            
            
            cowryWiseView2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: -20),
            cowryWiseView2.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1),
            cowryWiseView2.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.3),
            
            cowryWiseLogo2.widthAnchor.constraint(equalToConstant: 250),
            cowryWiseLogo2.heightAnchor.constraint(equalToConstant: 50),
            cowryWiseLogo2.centerXAnchor.constraint(equalTo: cowryWiseView2.centerXAnchor),
            cowryWiseLogo2.centerYAnchor.constraint(equalTo: cowryWiseView2.centerYAnchor),
            
            thirdView.topAnchor.constraint(equalTo: cowryWiseView2.bottomAnchor, constant: 0),
            thirdView.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 1),
            thirdView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.7),
            
            jumpBackLabel.topAnchor.constraint(equalTo: cowryWiseView2.layoutMarginsGuide.bottomAnchor, constant: 50),
            jumpBackLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor ),
        
            
            emailAddressLabel.topAnchor.constraint(equalTo: jumpBackLabel.layoutMarginsGuide.bottomAnchor,constant: 40),
            emailAddressLabel.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor,constant: 20),
            
            
            emailAddressTextField.topAnchor.constraint(equalTo: emailAddressLabel.bottomAnchor,constant: 20),
            emailAddressTextField.leadingAnchor.constraint(equalTo: emailAddressLabel.leadingAnchor),
            emailAddressTextField.widthAnchor.constraint(equalToConstant: 370),
            
            
            passWordLabel.topAnchor.constraint(equalTo: emailAddressTextField.layoutMarginsGuide.bottomAnchor,constant: 40),
            passWordLabel.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor,constant: 20),
            
            
            passwordTextField.topAnchor.constraint(equalTo: passWordLabel.bottomAnchor,constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: emailAddressLabel.leadingAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 370),
            
                                        loginButton.topAnchor.constraint(equalTo: passwordTextField.layoutMarginsGuide.bottomAnchor, constant: 40),
                                        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.90),
                                        loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
            forgotPassButton.topAnchor.constraint(equalTo: loginButton.layoutMarginsGuide.bottomAnchor, constant: 10),
            forgotPassButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPassButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.4),
            forgotPassButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
        ])
        
    }
    
}

struct Login: Codable {
    let email, password: String
}



