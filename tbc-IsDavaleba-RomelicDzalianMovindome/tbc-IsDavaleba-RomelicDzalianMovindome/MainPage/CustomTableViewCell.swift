//
//  CustomTableViewCell.swift
//  tbc-IsDavaleba-RomelicDzalianMovindome
//
//  Created by Giorgi Michitashvili on 5/3/24.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    let teqsti = UILabel()
    
    var cellIndex = Int()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        addSubview(teqsti)
        teqsti.translatesAutoresizingMaskIntoConstraints = false
        teqsti.textColor = UIColor.black
        teqsti.textAlignment = .center
        teqsti.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        teqsti.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true
        NSLayoutConstraint.activate([
            teqsti.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            teqsti.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            teqsti.topAnchor.constraint(equalTo: topAnchor),
            teqsti.leftAnchor.constraint(equalTo: leftAnchor, constant: 35)
        ])
    }
}
