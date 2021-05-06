//
//  CategoryHeaderView.swift
//  Chucknorris
//
//  Created by Abhijeet Malamkar on 5/5/21.
//

import UIKit

class CategoryHeaderView: UICollectionReusableView {
    
    let labelView:UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.textAlignment = .left
        view.font = UIFont.boldSystemFont(ofSize: 20)
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
        backgroundColor = UIColor(hexString: "#f9f9f9")
        addSubview(labelView)
        
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: topAnchor),
            labelView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            labelView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            labelView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

