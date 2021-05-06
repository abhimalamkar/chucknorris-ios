//
//  MainViewController.swift
//  Chucknorris
//
//  Created by Abhijeet Malamkar on 5/5/21.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController,
                          UICollectionViewDelegate,
                          UICollectionViewDelegateFlowLayout,
                          UICollectionViewDataSource,
                          FactDelegate {
    
    var categories:[Category] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    lazy var collectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 8
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.headerReferenceSize = CGSize(width: self.view.frame.width, height: 40)
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .white
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        setupNavigation()
        setupViews()
    }
    
    func getData(){
        NetworkUtil.categoriesUrl.getData { result in
            switch result {
            case .success(let data):
                self.categories = Category.builder(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupNavigation() {
        navigationItem.title = "ChuckNorris"
        navigationController?.navigationBar.tintColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupViews() {
        view.backgroundColor = .lightGray
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
        collectionView.register(FactsCell.self, forCellWithReuseIdentifier: "\(FactsCell.self)")
        collectionView.register(CategoryHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(CategoryHeaderView.self)")

    }
    
    func onClick(fact: Fact) {
        let controller = DetailsViewController()
        controller.fact = fact
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // ========= Collection View ============
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(CategoryHeaderView.self)", for: indexPath) as? CategoryHeaderView
        headerView?.frame.size.height = 40
        headerView?.labelView.text = categories[indexPath.section].title.capitalizingFirstLetter()
        return headerView!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FactsCell.self)", for: indexPath) as? FactsCell
        cell?.category = categories[indexPath.section].title
        cell?.delegate = self
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}

struct MainView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: MainViewController())
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
