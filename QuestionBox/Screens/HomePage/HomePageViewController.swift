//
//  HomePageViewController.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import UIKit

class HomePageViewController: BaseViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    var viewModel: HomePageViewModel = HomePageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        registerCollection()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func registerCollection() {
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        homeCollectionView.register(UINib(nibName: "HomePageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomePageCell")
    }
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.kategoriler.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCell", for: indexPath) as! HomePageCollectionViewCell
        let category = viewModel.kategoriler[indexPath.row]
        cell.setup(with: category)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = QuestionDetailCardViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let itemsPerRow: CGFloat = 3
        
        let totalPadding = padding * (itemsPerRow - 1)
        let individualPadding = totalPadding / itemsPerRow
        let collectionViewWidth = collectionView.frame.width
        
        let cellWidth = (collectionViewWidth - totalPadding) / itemsPerRow
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
