//
//  CategoryTableViewCell.swift
//  kino
//
//  Created by Saida Yessirkepova on 29.01.2023.
//

import UIKit

final class CategoryTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: - Setup views and constraints methods

private extension CategoryTableViewCell {
    func setupViews(){
        
    }
    func setupConstraints(){
        
    }
}
