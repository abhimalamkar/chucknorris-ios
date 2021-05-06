//
//  FactCell.swift
//  Chucknorris
//
//  Created by Abhijeet Malamkar on 5/5/21.
//

import UIKit

class FactCell: UICollectionViewCell {
        
    var fact:Fact? {
        didSet{
            DispatchQueue.main.async {
                self.factView.fact = self.fact
            }
        }
    }
    
    let factView: FactView = {
        let view = FactView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(factView)
        
        NSLayoutConstraint.activate([
            factView.topAnchor.constraint(equalTo: topAnchor),
            factView.leftAnchor.constraint(equalTo: leftAnchor),
            factView.rightAnchor.constraint(equalTo: rightAnchor),
            factView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
