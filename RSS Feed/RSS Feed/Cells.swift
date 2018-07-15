//
//  Cells.swift
//  RSS Feed
//
//  Created by Timothy Lee on 7/15/18.
//  Copyright © 2018 Timothy Lee. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {}
}

class FeedCells: BaseCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let snippetLabel: UILabel = {
        let label = UILabel()
        label.text = "Snippet"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    override func setupViews() {
        addSubview(titleLabel)
        addSubview(snippetLabel)
        addSubview(dividerView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: titleLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: snippetLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0]|", views: dividerView)
        addConstraintsWithFormat(format: "V:|-8-[v0(20)]-8-[v1][v2(0.5)]|", views: titleLabel, snippetLabel, dividerView)
    }
}
