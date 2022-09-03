//
//  customButtton.swift
//  TestAssignment
//
//  Created by Xasan Xasanov on 02/09/22.
//

import UIKit

struct TwoLinedButtonViewModel {
    let primaryText:String
    let secondaryText:String
}

final class customButtton: UIButton {
    private let primaryLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "4.8 (648)"
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
        
    }()
    
    private let secondaryLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Оценить"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        addSubview(primaryLabel)
        addSubview(secondaryLabel)
        clipsToBounds = true
        layer.cornerRadius = 8
      //  layer.borderColor = UIColor.secondarySystemBackground.cgColor
        backgroundColor = .systemGray6
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: TwoLinedButtonViewModel) {
        primaryLabel.text = viewModel.primaryText
        secondaryLabel.text = viewModel.secondaryText
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        primaryLabel.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height/2)
        secondaryLabel.frame = CGRect(x: 0, y: frame.size.height/2 , width: frame.size.width, height: frame.size.height/2)
    }
}
