//
//  ViewController.swift
//  RatingApp
//
//  Created by Mohamad Mortada on 10/25/20.
//
import MessageUI
import StoreKit
import UIKit
class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    private let button: UIButton = {
     let button = UIButton()
        button.setTitle("Rate Now", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 55)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
    @objc func buttonTapped() {
        let alert = UIAlertController(
            title: "Feedback",
            message: "Are you enjoying the App?",
            preferredStyle: .alert)
        
       alert.addAction(UIAlertAction(title: "Dismiss",style: .cancel, handler: nil))
       alert.addAction(UIAlertAction(title: "Yes I love it ",style: .default, handler: { [weak self]_ in
            
            guard let  scene = self?.view.window?.windowScene else {
        print("no scene")
        return
    }
            SKStoreReviewController.requestReview(in: scene)
        }))
       alert.addAction(UIAlertAction(title: "Nope I hate it",style: .default, handler: nil))
        
        present(alert, animated: true)

    }
  
    }



