//
//  profileViewController.swift
//  CowryWiseReplica
//
//  Created by Decagon on 09/05/2021.
//

import UIKit

class profileViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        loadProfile()
        
    }
    
    
    func loadProfile(){
        let url = "https://5f7505151cf3c900161cdb66.mockapi.io/api/v1/profile/5" //still change {2} to id in variable
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data,response,error in

            guard let data = data, error == nil else{
                print ("Something went wrong")
                return
            }
         
            
            var json:Profile?
            do{
                json = try JSONDecoder().decode(Profile.self, from: data)
            }
            catch{
                print("error:\(error)")
            }
            guard let result = json else {
                return
            }
            
            print(result)
            
            let firstname = result.firstName
            let lastname = result.lastName
            let username = result.userName
            let gender = result.gender
            let dob = result.dateOfBirth
            let nextOfKin = result.nextOfKin


            DispatchQueue.main.async {
                self.fNameTextfield.text = firstname
                self.lNameTextField.text = lastname
                self.usernameTextField.text = username
                self.dOBField.text = dob
                self.nextOfKinField.text =  nextOfKin

                if gender == true{
                    self.genderTextField.text = "male"

                } else{
                    self.genderTextField.text = "female"
                }
            }

        }).resume()
    }

    
    
    
    
    //        @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
    //        {
    //            print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
    //        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var fNameLabel:UILabel!
    var lNameLabel:UILabel!
    var userNameLabel:UILabel!
    var genderLabel:UILabel!
    var dOBLabel , nextOfKinLabel : UILabel!
    
    var fNameTextfield, lNameTextField, usernameTextField,genderTextField, dOBField,nextOfKinField :UITextField!
    
    
    override func loadView() {
        
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        let navView = UIView()
        let label = UILabel()
        
        label.text = "Profile"
        label.sizeToFit()
        label.center = navView.center
        label.textAlignment = .center
        navView.addSubview(label)
        self.navigationItem.titleView = navView
        navView.sizeToFit()
        
        let mySegmentedControl = UISegmentedControl (items: ["Personal","Security","Behaviour"])
        let xPostion:CGFloat = 40
        let yPostion:CGFloat = 100
        let elementWidth:CGFloat = 300
        let elementHeight:CGFloat = 40
        mySegmentedControl.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        
        // Make second segment selected
        mySegmentedControl.selectedSegmentIndex = 0
        
        //Change text color of UISegmentedControl
        mySegmentedControl.tintColor = #colorLiteral(red: 0.2747907639, green: 0.5571715236, blue: 0.8975776434, alpha: 1)
        
        //Change UISegmentedControl background colour
        mySegmentedControl.backgroundColor = #colorLiteral(red: 0.9332197309, green: 0.9333186746, blue: 0.9373039603, alpha: 1)
        
        // Add function to handle Value Changed events
        //        mySegmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        
        self.view.addSubview(mySegmentedControl)
        
        var profilePic: UIImageView!
        
        profilePic = UIImageView()
        profilePic = {
            let theImageView = UIImageView()
            theImageView.image = UIImage(named: "profilePic.png")
            theImageView.translatesAutoresizingMaskIntoConstraints = false
            return theImageView
        }()
        view.addSubview(profilePic)
        
        fNameLabel = UILabel()
        fNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fNameLabel.text = "Firstname"
        fNameLabel.font = UIFont.systemFont(ofSize: 18)
        fNameLabel.addLine(position: .bottom, color: .gray, width: 0.5)
        fNameLabel.textColor = #colorLiteral(red: 0.1814474463, green: 0.248290062, blue: 0.3769367337, alpha: 1)
        fNameLabel.textAlignment  = .left
        view.addSubview(fNameLabel)

        fNameTextfield = UITextField()
        fNameTextfield.translatesAutoresizingMaskIntoConstraints = false
        fNameTextfield.addLine(position: .bottom, color:.gray, width: 0.5)
        fNameTextfield.textAlignment = .left
        fNameTextfield.font = UIFont.systemFont(ofSize: 18)
        fNameTextfield.placeholder = "aries"
        fNameTextfield.isUserInteractionEnabled = true
        fNameTextfield.keyboardType = UIKeyboardType.default
        fNameTextfield.returnKeyType = UIReturnKeyType.default
        fNameTextfield.isUserInteractionEnabled = false
        view.addSubview(fNameTextfield)

        lNameLabel = UILabel()
        lNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lNameLabel.text = "Lastname"
        lNameLabel.font = UIFont.systemFont(ofSize: 18)
        lNameLabel.addLine(position: .bottom, color: .gray, width: 0.5)
        lNameLabel.textColor = #colorLiteral(red: 0.1814474463, green: 0.248290062, blue: 0.3769367337, alpha: 1)
        lNameLabel.textAlignment  = .left
        view.addSubview(lNameLabel)

        lNameTextField = UITextField()
        lNameTextField.translatesAutoresizingMaskIntoConstraints = false
        lNameTextField.addLine(position: .bottom, color:.gray, width: 0.5)
        lNameTextField.textAlignment = .left
        lNameTextField.font = UIFont.systemFont(ofSize: 18)
        lNameTextField.placeholder = "prime"
        lNameTextField.isUserInteractionEnabled = true
        lNameTextField.keyboardType = UIKeyboardType.default
        lNameTextField.returnKeyType = UIReturnKeyType.default
        lNameTextField.isUserInteractionEnabled = false
        view.addSubview(lNameTextField)

        userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Username"
        userNameLabel.font = UIFont.systemFont(ofSize: 18)
        userNameLabel.addLine(position: .bottom, color: .gray, width: 0.5)
        userNameLabel.textColor = #colorLiteral(red: 0.1814474463, green: 0.248290062, blue: 0.3769367337, alpha: 1)
        userNameLabel.textAlignment  = .left
        
        view.addSubview(userNameLabel)
        
        usernameTextField = UITextField()
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.addLine(position: .bottom, color:.gray, width: 0.5)
        usernameTextField.textAlignment = .left
        usernameTextField.font = UIFont.systemFont(ofSize: 18)
        usernameTextField.placeholder = "@username"
        usernameTextField.isUserInteractionEnabled = true
        usernameTextField.keyboardType = UIKeyboardType.default
        usernameTextField.returnKeyType = UIReturnKeyType.default
        usernameTextField.isUserInteractionEnabled = false
        view.addSubview(usernameTextField)
        
        
        
        genderLabel = UILabel()
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.text = "Gender"
        genderLabel.font = UIFont.systemFont(ofSize: 18)
        genderLabel.addLine(position: .bottom, color: .gray, width: 0.5)
        genderLabel.textColor = #colorLiteral(red: 0.1814474463, green: 0.248290062, blue: 0.3769367337, alpha: 1)
        genderLabel.textAlignment  = .left
        view.addSubview(genderLabel)
        
        genderTextField = UITextField()
        genderTextField.translatesAutoresizingMaskIntoConstraints = false
        genderTextField.placeholder = "Gender"
        genderTextField.font = UIFont.systemFont(ofSize: 18)
        genderTextField.addLine(position: .bottom, color: .gray, width: 0.5)
        genderTextField.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        genderTextField.textAlignment  = .left
        genderTextField.isUserInteractionEnabled = false
        view.addSubview(genderTextField)
        
        
        dOBLabel = UILabel()
        dOBLabel.translatesAutoresizingMaskIntoConstraints = false
        dOBLabel.text = "Date of Birth"
        dOBLabel.font = UIFont.systemFont(ofSize: 18)
        dOBLabel.addLine(position: .bottom, color: .gray, width: 0.5)
        dOBLabel.textColor = #colorLiteral(red: 0.1814474463, green: 0.248290062, blue: 0.3769367337, alpha: 1)
        dOBLabel.textAlignment  = .left
        view.addSubview(dOBLabel)
        
        
        dOBField = UITextField()
        dOBField.translatesAutoresizingMaskIntoConstraints = false
        dOBField.placeholder = "DOB"
        dOBField.font = UIFont.systemFont(ofSize: 18)
        dOBField.addLine(position: .bottom, color: .gray, width: 0.5)
        dOBField.textColor = #colorLiteral(red: 0.1814474463, green: 0.248290062, blue: 0.3769367337, alpha: 1)
        dOBField.textAlignment  = .left
        view.addSubview(dOBField)
        
        
        nextOfKinLabel = UILabel()
        nextOfKinLabel.translatesAutoresizingMaskIntoConstraints = false
        nextOfKinLabel.text = "Next of Kin"
        nextOfKinLabel.font = UIFont.systemFont(ofSize: 18)
        nextOfKinLabel.addLine(position: .bottom, color: .gray, width: 0.5)
        nextOfKinLabel.textColor = #colorLiteral(red: 0.1814474463, green: 0.248290062, blue: 0.3769367337, alpha: 1)
        nextOfKinLabel.textAlignment  = .left
        view.addSubview(nextOfKinLabel)
        
        nextOfKinField = UITextField()
        nextOfKinField.translatesAutoresizingMaskIntoConstraints = false
        nextOfKinField.placeholder = "Next of Kin"
        nextOfKinField.font = UIFont.systemFont(ofSize: 18)
        nextOfKinField.addLine(position: .bottom, color: .gray, width: 0.5)
        nextOfKinField.textColor = #colorLiteral(red: 0.1814474463, green: 0.248290062, blue: 0.3769367337, alpha: 1)
        nextOfKinField.textAlignment  = .left
        view.addSubview(nextOfKinField)
        
        
        
        
        
        //COnstraints left
        
        
        
        NSLayoutConstraint.activate([
            
            profilePic.widthAnchor.constraint(equalToConstant: 150),
            profilePic.heightAnchor.constraint(equalToConstant: 150),
            profilePic.topAnchor.constraint(equalTo: mySegmentedControl.topAnchor,constant: 70),
            profilePic.centerXAnchor.constraint(equalTo: mySegmentedControl.centerXAnchor),
            
            fNameLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor,constant: 50),
            fNameLabel.leadingAnchor.constraint(equalTo: mySegmentedControl.leadingAnchor),
            fNameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            fNameTextfield.topAnchor.constraint(equalTo: profilePic.bottomAnchor,constant: 48),
            fNameTextfield.leadingAnchor.constraint(equalTo: fNameLabel.trailingAnchor,constant: 0),
            fNameTextfield.widthAnchor.constraint(equalToConstant: 100),
            
            
            lNameLabel.topAnchor.constraint(equalTo: fNameLabel.bottomAnchor,constant:50 ),
            lNameLabel.leadingAnchor.constraint(equalTo: mySegmentedControl.leadingAnchor),
            lNameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            lNameTextField.topAnchor.constraint(equalTo: fNameTextfield.bottomAnchor,constant: 48),
            lNameTextField.leadingAnchor.constraint(equalTo: lNameLabel.trailingAnchor,constant: 0),
            lNameTextField.widthAnchor.constraint(equalToConstant: 100),
            
            userNameLabel.topAnchor.constraint(equalTo: lNameLabel.bottomAnchor,constant: 50),
            userNameLabel.leadingAnchor.constraint(equalTo: mySegmentedControl.leadingAnchor),
            userNameLabel.widthAnchor.constraint(equalToConstant: 200),
            
            usernameTextField.topAnchor.constraint(equalTo: lNameLabel.bottomAnchor,constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: lNameLabel.trailingAnchor,constant: 0),
            usernameTextField.widthAnchor.constraint(equalToConstant: 100),
            
            genderLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor,constant: 48),genderLabel.leadingAnchor.constraint(equalTo: mySegmentedControl.leadingAnchor),
            genderLabel.widthAnchor.constraint(equalToConstant: 200),
            
            genderTextField.topAnchor.constraint(equalTo: genderLabel.topAnchor,constant: -2),
            genderTextField.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor,constant: 0),
            genderTextField.widthAnchor.constraint(equalToConstant: 100),
            
            dOBLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor,constant: 50),
            dOBLabel.leadingAnchor.constraint(equalTo: mySegmentedControl.leadingAnchor),
            dOBLabel.widthAnchor.constraint(equalToConstant: 200),
            
            dOBField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor,constant: 50),
            dOBField.leadingAnchor.constraint(equalTo: dOBLabel.trailingAnchor),
            dOBField.widthAnchor.constraint(equalToConstant: 100),

            
            nextOfKinLabel.topAnchor.constraint(equalTo: dOBLabel.bottomAnchor,constant: 50),
            nextOfKinLabel.leadingAnchor.constraint(equalTo: mySegmentedControl.leadingAnchor),
            nextOfKinLabel.widthAnchor.constraint(equalToConstant: 200),
            
            nextOfKinField.topAnchor.constraint(equalTo: dOBLabel.bottomAnchor,constant: 50),
            nextOfKinField.leadingAnchor.constraint(equalTo: nextOfKinLabel.trailingAnchor),
            nextOfKinField.widthAnchor.constraint(equalToConstant: 100),

            
            
        ])
    }
}



struct Profile: Codable {
    let id:String?
    let firstName:String?
    let lastName:String?
    let userName: String?
    let gender: Bool?
    let dateOfBirth:String?
    let nextOfKin:String?
    let postalAddress:String?
    let email: String?
    let phoneNumber: String?
}
