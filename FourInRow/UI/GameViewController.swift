//
//  ViewController.swift
//  FourInRow
//
//  Created by Tatiana Ampilogova on 5/26/24.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    private var game = Game()
    private var playerLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 45.0, height: 45.0)
        layout.minimumInteritemSpacing = 3
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }
    
    private func setUpCollectionView() {
        collectionView.register(FieldItemCell.self, forCellWithReuseIdentifier: FieldItemCell.className)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5)
        ])
    }
    
    private func setupPlayer() {
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playerLabel)
        NSLayoutConstraint.activate([
            playerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            playerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        playerLabel.text = game.changePlayer()
    }
    
    private func setUpUI() {
        setupPlayer()
        setUpCollectionView()
    }
    
    //MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return game.rows
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.columns
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FieldItemCell.className, for: indexPath) as! FieldItemCell
        let item = game.field[indexPath.section][indexPath.row]
        cell.makeRounded()
        cell.configure(item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let column = indexPath.item
        if game.makeTurn(column: column, player: game.currentPlayer.id) {
            collectionView.reloadData()
            if game.checkWin(player: game.currentPlayer.id) {
                print("win")
            } else {
                game.currentPlayer.id = game.currentPlayer.id == 1 ? 2 : 1
                playerLabel.text = game.changePlayer()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width / CGFloat(game.field.count + 1)).rounded(.down)
        return CGSize(width: size, height: size)
    }
}

