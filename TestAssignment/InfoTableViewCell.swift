//
//  InfoTableViewCell.swift
//  TestAssignment
//
//  Created by Xasan Xasanov on 03/09/22.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
     
    
    static let identifier = "InfoTableViewCell"
     var product : Info? {
     didSet {
         image.image = product?.image
        
         infoName.text = product?.infoName
     
     
     }
     }
     
     
     private let infoName : UILabel = {
     let lbl = UILabel()
     
     lbl.tintColor = .green
     lbl.numberOfLines = 0
     lbl.font = UIFont.boldSystemFont(ofSize: 16)
     lbl.textAlignment = .left
     return lbl
     }()
     
     
   
     
   
     
     private let image : UIImageView = {
     let imgView = UIImageView()
     imgView.contentMode = .scaleAspectFit
     imgView.clipsToBounds = true
         imgView.tintColor = .green
         imgView.frame = CGRect(x: 0, y:0 , width: 10, height: 10)
     return imgView
     }()
     
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
     addSubview(image)
     addSubview(infoName)
   
     
        image.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 30, height: frame.size.height / 3 , enableInsets: false)
        infoName.anchor(top: topAnchor, left: image.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 0, enableInsets: false)
       
    
    
     
    
     
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
