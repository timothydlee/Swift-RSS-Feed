//
//  ViewController.swift
//  RSS Feed
//
//  Created by Timothy Lee on 7/15/18.
//  Copyright © 2018 Timothy Lee. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    let headerId = "headerId"
    
    var entries: [Entry]? = [
        Entry(title: "Sample Title 1", contentSnippet: "Sample Content Snippet 1", url: nil),
        Entry(title: "Sample Title 2", contentSnippet: "Sample Content Snippet 2", url: nil),
        Entry(title: "Sample Title 3", contentSnippet: "Sample Content Snippet 3", url: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "RSS Reader"
        collectionView?.backgroundColor = .white
        collectionView?.register(FeedCells.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (entries?.count)!
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCells
        let entry = entries![indexPath.item]
        cell.titleLabel.text = entry.title
        cell.snippetLabel.text = entry.contentSnippet
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderCell
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
}

