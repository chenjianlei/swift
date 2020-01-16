//
//  ComponsentLandscapeCollectionView.swift
//  Sports
//
//  Created by Sun Moon on 2020/1/13.
//  Copyright © 2020 Sun Moon. All rights reserved.
//

import UIKit

class ComponsentLandscapeCollectionView: UITableViewCell {
    
    var delegate: EventDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .color_353331
        makeInitSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 100, height: 100)
        layout.sectionInset = .init(top: 5, left: 15, bottom: 15, right: 15)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let c = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        c.showsVerticalScrollIndicator = false
        c.showsHorizontalScrollIndicator = false
        c.register(ComponsentCollectionImageViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(ComponsentCollectionImageViewCell.self))
        c.dataSource = self
        c.delegate = self
        c.backgroundColor = .color_353331
        return c
    }()
    
    private func makeInitSubviews() {
        contentView.addSubview(collectionView)
        makeInitLayout()
    }
    
    private func makeInitLayout() {
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}

extension ComponsentLandscapeCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ComponsentCollectionImageViewCell.self), for: indexPath) as! ComponsentCollectionImageViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}

extension ComponsentLandscapeCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let array = ["a", "b", "c", "d", "e"]
        let objs: [Any] = [["a": "a"], [1, 2, 3], "string", self, 4]
        let obj = EventObj.init(params: objs[indexPath.row], name: array[indexPath.row])
        self.delegate?.onEvent(obj)
    }
}
