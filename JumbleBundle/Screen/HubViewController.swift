//
//  ViewController.swift
//  JumbleBundle
//
//  Created by Porori on 4/22/24.
//

import UIKit

class HubViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var hubCollectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Title.overall.rawValue
        configureCollectionview()
    }
    
    private func configureCollectionview() {
        let collectionview = UICollectionView(frame: view.bounds, collectionViewLayout: configureLayout())
        view.addSubview(collectionview)
        self.hubCollectionView = collectionview
        
        collectionview.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        let nib = UINib(nibName: TestCollectionViewCell.reuseIdentifier, bundle: nil)
        collectionview.register(nib, forCellWithReuseIdentifier: TestCollectionViewCell.reuseIdentifier)
        
        collectionview.delegate = self
        collectionview.dataSource = self
    }
    
    private func configureLayout() -> UICollectionViewLayout {
        let list = UICollectionLayoutListConfiguration(appearance: .grouped)
        let flowlayout = UICollectionViewCompositionalLayout.list(using: list)
        return flowlayout
    }
    
    //    private lazy var hubItems: [HubCollectionItem] = {
    //        return [
    //            HubCollectionItem(title: "타이틀 타이틀", subItem: [
    //                HubCollectionItem(title: "이름이름", viewController: TestViewController.self)
    //            ])
    //        ]
    //    }()
}

extension HubViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Title.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TestCollectionViewCell.reuseIdentifier, for: indexPath) as! TestCollectionViewCell
        
        let title = Title.allCases[indexPath.item]
        cell.configureLabel(text: title.rawValue)
        return cell
    }
}

extension HubViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = Title.allCases[indexPath.item].rawValue
        
        print(indexPath)
        
        switch indexPath.item {
        case 0:
            let nextVC = TestViewController()
            nextVC.title = title
            self.navigationController?.pushViewController(nextVC, animated: true)
        case 1:
            let nextVC = TestViewController()
            nextVC.title = title
            nextVC.view.backgroundColor = .green
            self.navigationController?.pushViewController(nextVC, animated: true)
        default:
            return
        }
    }
}
