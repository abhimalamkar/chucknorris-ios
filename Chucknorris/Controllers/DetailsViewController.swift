//
//  DetailsViewController.swift
//  Chucknorris
//
//  Created by Abhijeet Malamkar on 5/6/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var fact:Fact? {
        didSet{
            DispatchQueue.main.async {
                self.factView.fact = self.fact
                if let url = self.fact?.icon_url {
                    self.imageView.downloadImageFrom(urlString: url, imageMode: .scaleAspectFit)
                }
            }
        }
    }
    
    let factView: FactView = {
        let view = FactView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupNavigation()
    }
    
    func setupNavigation() {
        navigationController?.navigationBar.tintColor = .darkGray
    }
    
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.addSubview(factView)
        
        NSLayoutConstraint.activate([
            factView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            factView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            factView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            factView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
        ])
    }
    
}
