//
//  PhCollectionViewCell.swift
//  TestAssignment
//
//  Created by Xasan Xasanov on 03/09/22.
//

import UIKit

class PhCollectionViewCell: UICollectionViewCell {
    static var id = "PhCollectionViewCell"
    
    private var image:UIImageView {
        let image = UIImageView()
       
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.tintColor = .green
        return image
    }
    override init(frame:CGRect) {
           super.init(frame: frame)
           contentView.addSubview(image)
        image.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
           
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
      

}
