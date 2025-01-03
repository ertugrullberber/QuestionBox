//
//  QuestionDetailCardViewController.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 7.07.2024.
//

import UIKit

class QuestionDetailCardViewController: UIViewController {

    var kategori: Kategori?
    private var currentIndex: IndexPath = IndexPath(item: 0, section: 0)
    
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var questionCollectionView: UICollectionView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = false
        setupCollectionView()
        updateQuestionTitle()
    }
    
    private func setupCollectionView() {
        questionCollectionView.delegate = self
        questionCollectionView.dataSource = self
        questionCollectionView.register(UINib(nibName: "QuestionDetailCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QuestionDetailCardCollectionViewCell")
    }

    private func updateQuestionTitle() {
        questionTitle.text = kategori?.isim
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let newIndex = max(currentIndex.item - 1, 0)
        scrollToItem(at: IndexPath(item: newIndex, section: 0))
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let newIndex = min(currentIndex.item + 1, (kategori?.sorular.count ?? 1) - 1)
        scrollToItem(at: IndexPath(item: newIndex, section: 0))
    }

    private func scrollToItem(at indexPath: IndexPath) {
        questionCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        currentIndex = indexPath
    }
}

extension QuestionDetailCardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kategori?.sorular.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionDetailCardCollectionViewCell", for: indexPath) as! QuestionDetailCardCollectionViewCell
        if let question = kategori?.sorular[indexPath.item] {
            cell.setup(with: question)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        currentIndex = IndexPath(item: currentPage, section: 0)
    }
}
