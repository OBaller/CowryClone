//
//  SecondPageVIewController.swift
//  CowryWiseReplica
//
//  Created by Decagon on 08/05/2021.
//

import UIKit


class SecondPageVIewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @objc func buttonClicked(){
        let allSet = allSetViewController()
        allSet.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(allSet, animated: true)
    }
    
    var email: String = ""
    
    var getToKnowYouLabel:UILabel!
    var fNameField:UITextField!
    var lNameField:UITextField!
    var passwordField:UITextField!
    var phoneField:UITextField!
    var continueButton:UIButton!
    var gotInvite:UIButton!
    var bySigningUp:UILabel!
    var termsAndConditions:UIButton!
    var andLabel:UILabel!
    var privacyPolicy:UIButton!
    
    
    @objc func loginPressed(){
        
        let email_ = email
       guard  let password = passwordField.text  else {return}
       guard  let firstName = fNameField.text  else {return}
       guard let lastName = lNameField.text else {return}
       guard let phoneNumber = phoneField.text  else {return}
       
       if email_.isValidEmail == false && password == "" {
           let videoAlert = UIAlertController(title: "Login Error", message: "You have provided invalid email or password. Please check and try again", preferredStyle: .alert)
           videoAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(videoAlert, animated: true, completion: nil)
        }

                if  email_.isValidEmail == true && password != "" {
                    LoginPls()
                }
        
        
       
    //MARK:- NETWORK CALLS START
        
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        
        func LoginPls() {
            let parameters = ["email": email_, "password": password,"firstName":firstName,"lastName":lastName,"phoneNumber":phoneNumber] as [String : Any]

            //create the url with URL
            let url = URL(string: "https://609908f199011f001713ffb0.mockapi.io/api/v1/signup")!

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
                        
                        if let httpResponse = response as? HTTPURLResponse {
                            print(" \(httpResponse.statusCode)")
                            
                        }
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
                buttonClicked()
    }
    //MARK:- NETWORK CALLS END
    
    //MARK:- SETUP UI
    
    override func loadView() {
        view = UIView()
        
        view.backgroundColor = .white
        getToKnowYouLabel = UILabel()
        getToKnowYouLabel.translatesAutoresizingMaskIntoConstraints = false
        getToKnowYouLabel.text = "Let's get to know you."
        getToKnowYouLabel.font = UIFont.systemFont(ofSize: 30)
        getToKnowYouLabel.textColor = #colorLiteral(red: 0.09365727752, green: 0.2302636802, blue: 0.4337103665, alpha: 1)
        getToKnowYouLabel.textAlignment  = .left
        view.addSubview(getToKnowYouLabel)
        
        fNameField = UITextField()
        fNameField.translatesAutoresizingMaskIntoConstraints = false
        fNameField.addLine(position: .bottom, color:.gray, width: 0.5)
        fNameField.textAlignment = .left
        fNameField.font = UIFont.systemFont(ofSize: 20)
        fNameField.placeholder = "First Name"
        fNameField.isUserInteractionEnabled = true
        fNameField.keyboardType = UIKeyboardType.default
        fNameField.returnKeyType = UIReturnKeyType.default
        view.addSubview(fNameField)
        
        
        lNameField = UITextField()
        lNameField.translatesAutoresizingMaskIntoConstraints = false
        lNameField.addLine(position: .bottom, color:.gray, width: 0.5)
        lNameField.textAlignment = .left
        lNameField.font = UIFont.systemFont(ofSize: 20)
        lNameField.placeholder = "Last Name"
        lNameField.isUserInteractionEnabled = true
        lNameField.keyboardType = UIKeyboardType.default
        lNameField.returnKeyType = UIReturnKeyType.default
        view.addSubview(lNameField)
        
        passwordField = UITextField()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.addLine(position: .bottom, color:.gray, width: 0.5)
        passwordField.textAlignment = .left
        passwordField.font = UIFont.systemFont(ofSize: 20)
        passwordField.placeholder = "                    "
        passwordField.isUserInteractionEnabled = true
        passwordField.keyboardType = UIKeyboardType.default
        passwordField.returnKeyType = UIReturnKeyType.default
        passwordField.isSecureTextEntry.toggle()
        passwordField.placeholder = "Password"
        view.addSubview(passwordField)
        
        //eye button missing toggle
        
        
        phoneField = UITextField()
        phoneField = UITextField()
        phoneField.translatesAutoresizingMaskIntoConstraints = false
        phoneField.addLine(position: .bottom, color:.gray, width: 0.5)
        phoneField.textAlignment = .left
        phoneField.font = UIFont.systemFont(ofSize: 20)
        phoneField.placeholder = "                      "
        phoneField.isUserInteractionEnabled = true
        phoneField.keyboardType = UIKeyboardType.decimalPad
        phoneField.returnKeyType = UIReturnKeyType.default
        phoneField.placeholder = "Phone Number"
        view.addSubview(phoneField)
        
        continueButton = UIButton()
        continueButton.setTitle("Continue", for: .normal)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.backgroundColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        continueButton.layer.cornerRadius = 5.0
        continueButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        view.addSubview(continueButton)
        
        
        gotInvite = UIButton()
        gotInvite.setTitle("Got an invite code?", for:.normal)
        gotInvite.setTitleColor(UIColor.blue, for: .normal)
        gotInvite.translatesAutoresizingMaskIntoConstraints = false
        gotInvite.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        gotInvite.layer.cornerRadius = 5.0
        view.addSubview(gotInvite)
        
        
        bySigningUp = UILabel()
        bySigningUp = UILabel()
        bySigningUp.translatesAutoresizingMaskIntoConstraints = false
        bySigningUp.text = "By signing up you agree to our"
        bySigningUp.font = UIFont.systemFont(ofSize: 15)
        bySigningUp.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        bySigningUp.textAlignment  = .left
        view.addSubview(bySigningUp)
        
        
        termsAndConditions = UIButton()
        termsAndConditions.setTitle("Terms & Conditions", for:.normal)
        termsAndConditions.setTitleColor(UIColor.gray, for: .normal)
        termsAndConditions.translatesAutoresizingMaskIntoConstraints = false
        termsAndConditions.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        termsAndConditions.addLine(position: .bottom, color: .gray, width: 0.5)
        termsAndConditions.layer.cornerRadius = 5.0
        view.addSubview(termsAndConditions)
        
        andLabel = UILabel()
        andLabel.translatesAutoresizingMaskIntoConstraints = false
        andLabel.text = "and"
        andLabel.font = UIFont.systemFont(ofSize: 15)
        andLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        andLabel.textAlignment  = .center
        view.addSubview(andLabel)
        
        privacyPolicy = UIButton()
        privacyPolicy.setTitle("Privacy Policy", for: .normal)
        privacyPolicy.setTitleColor(UIColor.gray, for: .normal)
        privacyPolicy.translatesAutoresizingMaskIntoConstraints = false
        privacyPolicy.addLine(position: .bottom, color: .gray, width: 0.5)
        privacyPolicy.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        privacyPolicy.layer.cornerRadius = 5.0
        view.addSubview(privacyPolicy)
        
        //MARK:- UI SETUP END
        
        
        
        //MARK:- CONSTRAINTS START
        
        NSLayoutConstraint.activate([
            
            getToKnowYouLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 60),
            getToKnowYouLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor ),
            
            
            fNameField.topAnchor.constraint(equalTo: getToKnowYouLabel.bottomAnchor,constant: 50),
            fNameField.leadingAnchor.constraint(equalTo: getToKnowYouLabel.leadingAnchor),
            fNameField.widthAnchor.constraint(equalToConstant: 170),
            
            lNameField.topAnchor.constraint(equalTo: getToKnowYouLabel.bottomAnchor, constant: 50),
            lNameField.leadingAnchor.constraint(equalTo: fNameField.trailingAnchor, constant: 30),
            lNameField.widthAnchor.constraint(equalToConstant: 170),
            
            
            passwordField.topAnchor.constraint(equalTo: lNameField.bottomAnchor,constant: 100),
            passwordField.leadingAnchor.constraint(equalTo: fNameField.leadingAnchor),
            passwordField.widthAnchor.constraint(equalToConstant: 380),
            
            
            phoneField.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 100),
            phoneField.leadingAnchor.constraint(equalTo: passwordField.leadingAnchor),
            phoneField.widthAnchor.constraint(equalToConstant: 380),
            
            continueButton.topAnchor.constraint(equalTo: phoneField.layoutMarginsGuide.bottomAnchor, constant: 60),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.90),
            continueButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
            
            gotInvite.topAnchor.constraint(equalTo: continueButton.layoutMarginsGuide.bottomAnchor, constant: 40),
            gotInvite.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gotInvite.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.4),
            gotInvite.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
            bySigningUp.topAnchor.constraint(equalTo: gotInvite.layoutMarginsGuide.bottomAnchor, constant: 20),
            bySigningUp.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            
            termsAndConditions.topAnchor.constraint(equalTo: gotInvite.bottomAnchor, constant: 5.5),
            termsAndConditions.leadingAnchor.constraint(equalTo: bySigningUp.trailingAnchor, constant:5),
            
            andLabel.topAnchor.constraint(equalTo: termsAndConditions.bottomAnchor, constant:10),
            andLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor,constant:150 ),
            
            privacyPolicy.topAnchor.constraint(equalTo: termsAndConditions.bottomAnchor, constant:5),
            privacyPolicy.leadingAnchor.constraint(equalTo: andLabel.trailingAnchor,constant:3 ),
            
            
            
            
            
        ])
        
    }
    
}
//MARK:- CONSTRAINTS END

//MARK:- STRUCTS



struct SignUp: Codable {
    let firstName, lastName, email, password: String
    let phoneNumber: String
}

