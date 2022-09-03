//
//  LabelTableViewCell.swift
//  TestAssignment
//
//  Created by Xasan Xasanov on 03/09/22.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    static let identifier2 = "LabelTableViewCell"
    private let label:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
        
        label.tintColor = .black
        return label
    }()
    
    override init(style: LabelTableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
      contentView.addSubview(label)
        label.frame = CGRect(x: 15, y: 0, width: contentView.frame.width, height: 200)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    



    

}
