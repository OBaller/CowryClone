//
//  allSetViewController.swift
//  CowryWiseReplica
//
//  Created by Decagon on 09/05/2021.
//

import UIKit

class allSetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = .black
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "close")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "close")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    @objc func buttonClicked(sender : UIButton){
                let allSet = profileViewController()
        allSet.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(allSet, animated: true)
        //        self.present(newViewController, animated: true, completion: nil)
            }
    
    var cowryWiseAllSetLogo: UIImageView!
    var allSetLabel:UILabel!
    var welcomeToTheFamily:UILabel!
    var exploreButton:UIButton!
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        
        
        cowryWiseAllSetLogo = {
            let theImageView = UIImageView()
            theImageView.image = UIImage(named: "allSetLogo.png")
            theImageView.translatesAutoresizingMaskIntoConstraints = false
            return theImageView
        }()
        view.addSubview(cowryWiseAllSetLogo)
        
        allSetLabel = UILabel()
        allSetLabel.translatesAutoresizingMaskIntoConstraints = false
        allSetLabel.text = "You're all set!"
        allSetLabel.font = UIFont.systemFont(ofSize: 40)
        allSetLabel.textColor = #colorLiteral(red: 0.09365727752, green: 0.2302636802, blue: 0.4337103665, alpha: 1)
        allSetLabel.textAlignment  = .left
        view.addSubview(allSetLabel)

        welcomeToTheFamily = UILabel()
        welcomeToTheFamily.translatesAutoresizingMaskIntoConstraints = false
        welcomeToTheFamily.text = "Welcome to the family!"
        welcomeToTheFamily.font = UIFont.systemFont(ofSize: 20)
        welcomeToTheFamily.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        welcomeToTheFamily.textAlignment  = .left
        view.addSubview(welcomeToTheFamily)
        
        
        exploreButton = UIButton()
        exploreButton.setTitle("Explore Cowrywise", for: .normal)
        exploreButton.translatesAutoresizingMaskIntoConstraints = false
        exploreButton.setTitleColor(UIColor.white, for: .normal)
        exploreButton.backgroundColor = #colorLiteral(red: 0.0004122248502, green: 0.4016033709, blue: 0.9599071145, alpha: 1)
        exploreButton.layer.cornerRadius = 5.0
        exploreButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(exploreButton)
        
        
        
        
        
        NSLayoutConstraint.activate([
        
            cowryWiseAllSetLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
            cowryWiseAllSetLogo.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1),
            
            
            allSetLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180),
            allSetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20 ),
            
            welcomeToTheFamily.bottomAnchor.constraint(equalTo: allSetLabel.bottomAnchor, constant: 30),
            welcomeToTheFamily.leadingAnchor.constraint(equalTo: allSetLabel.leadingAnchor, constant: 5 ),
            
            exploreButton.topAnchor.constraint(equalTo: welcomeToTheFamily.layoutMarginsGuide.bottomAnchor, constant: 30),
            exploreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exploreButton.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.90),
            exploreButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
        ])
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
