//
//  PhotoTableViewCell.swift
//  TestAssignment
//
//  Created by Xasan Xasanov on 03/09/22.
//

import UIKit

class PhotoTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
  
   static var iden = "PhotoTableViewCell"
    

    private let collectionView: UICollectionView = {
           
               let layout = UICollectionViewFlowLayout()
               layout.itemSize = CGSize(width: 140, height: 150)
               layout.scrollDirection = .horizontal
               let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           collectionView.register(PhCollectionViewCell.self, forCellWithReuseIdentifier: PhCollectionViewCell.id)
               return collectionView
           }()
    
    

override init(style: PhotoTableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(collectionView)
    
            collectionView.dataSource = self
            collectionView.delegate = self

    
}
required init(coder:NSCoder) {
       fatalError()
}
    
    override func layoutSubviews() {
          super.layoutSubviews()
          collectionView.frame = contentView.bounds
          
      }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhCollectionViewCell.id, for: indexPath) as!
        PhCollectionViewCell
          
     
        cell.backgroundColor = .black
        return cell
 
    }
}
