//
//  CollectionViewController.swift
//  TestWorkSiberian3
//
//  Created by Наташа on 18.07.2022.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    private enum PresentationStyle: String, CaseIterable {
        case table
        case defaultGrid
        case customGrid
        
        var buttonImage: UIImage {
            switch self {
            case .table: return #imageLiteral(resourceName: "table")
            case .defaultGrid: return #imageLiteral(resourceName: "default_grid")
            case .customGrid: return #imageLiteral(resourceName: "custom_grid")
            }
        }
    }
    private var selectedStyle: PresentationStyle = .table {
        didSet { updatePresentationStyle() }
    }
    private var styleDelegates: [PresentationStyle: CollectionViewSelectableItemDelegate] = {
        let result: [PresentationStyle: CollectionViewSelectableItemDelegate] = [
            .table: TabledContentCollectionViewDelegate(),
            .defaultGrid: DefaultGriddedContentCollectionViewDelegate(),
            .customGrid: CustomGriddedContentCollectionViewDelegate(),
        ]
        result.values.forEach {
            $0.didSelectItem = { _ in
                print("Item selected")
                guard let vc = UIStoryboard(name: "DetailVC", bundle: nil).instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
                let topvc = UIApplication.topViewController()
                topvc?.navigationController?.pushViewController(vc, animated: true)
            }
        }
        return result
    }()
    
    private var datasource: [Fruit] = FruitsProvider.get()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePresentationStyle()
    }
    
    private func updatePresentationStyle() {
        collectionView.register(CollectionViewCell.nib, forCellWithReuseIdentifier: CollectionViewCell.reuseID)
        collectionView.contentInset = .zero
        collectionView.delegate = styleDelegates[selectedStyle]
        collectionView.performBatchUpdates({
            collectionView.reloadData()
        }, completion: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: selectedStyle.buttonImage, style: .plain, target: self, action: #selector(changeContentLayout))
        navigationItem.rightBarButtonItem?.image = selectedStyle.buttonImage
    }
    
    @objc private func changeContentLayout() {
        let allCases = PresentationStyle.allCases
        guard let index = allCases.firstIndex(of: selectedStyle) else { return }
        let nextIndex = (index + 1) % allCases.count
        selectedStyle = allCases[nextIndex]
    }
}

// MARK: UICollectionViewDataSource & UICollectionViewDelegate
extension CollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseID,
                                                            for: indexPath) as? CollectionViewCell else {
            fatalError("Wrong cell")
        }
        let fruit = datasource[indexPath.item]
        cell.update(title: fruit.name, image: fruit.icon)
        return cell
    }
}
