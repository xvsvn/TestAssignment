//
//  iconText.swift
//  TestAssignment
//
//  Created by Xasan Xasanov on 02/09/22.
//

import UIKit

struct iconButtonViewModel {
    let text:String
    let image:UIImage?
     
}

final class iconTextButtton: UIButton {
    private let label:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "4.8 (648)"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
        
    }()
    
    private let iconImageVIew:UIImageView = {
     let  imageView = UIImageView()
        
        imageView.tintColor = .green
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
      
        addSubview(iconImageVIew)
        addSubview(label)
        clipsToBounds = true
        layer.cornerRadius = 8
      //  layer.borderColor = UIColor.secondarySystemBackground.cgColor
        backgroundColor = .systemGray6
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: iconButtonViewModel) {
      
        iconImageVIew.image = viewModel.image
        label.text = viewModel.text
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
     
       
        label.frame = CGRect(x: 0, y: frame.size.height/2 , width: frame.size.width, height: frame.size.height/2)
        iconImageVIew.frame = CGRect(x: 60, y: 0, width: 20, height: 20)
    }
}
