//
//  FactView.swift
//  Chucknorris
//
//  Created by Abhijeet Malamkar on 5/6/21.
//

import UIKit

class FactView: UIView {
    
    var fact:Fact? {
        didSet{
            DispatchQueue.main.async {
                self.labelView.text = self.fact?.value
            }
        }
    }
    
    let labelView:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.textAlignment = .center
        return view
    }()
    
    let sideView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#CCCCCC")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor(hexString: "#F9F9F9")
        
        addSubview(sideView)
        
        NSLayoutConstraint.activate([
            sideView.topAnchor.constraint(equalTo: topAnchor),
            sideView.leftAnchor.constraint(equalTo: leftAnchor),
            sideView.widthAnchor.constraint(equalToConstant: 16),
            sideView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        addSubview(labelView)
        
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: topAnchor),
            labelView.leftAnchor.constraint(equalTo: sideView.rightAnchor, constant: 16),
            labelView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
