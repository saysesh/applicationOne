//
//  SectionTableViewCell.swift
//  doList
//
//  Created by Saida Yessirkepova on 01.03.2023.
//

import UIKit

final class TodoeyTableViewCell: UITableViewCell {
    
    static let identifier = "SectionTableViewCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Section"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with name: String) {
        nameLabel.text = name
    }
}

//MARK: - Setup views and constraints methods

private extension TodoeyTableViewCell {
    func setupViews(){
        contentView.addSubview(nameLabel)
    }
    func setupConstraints(){
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
    }
}
