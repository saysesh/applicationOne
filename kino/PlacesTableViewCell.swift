//
//  PlacesTableViewCell.swift
//  kino
//
//  Created by Saida Yessirkepova on 30.01.2023.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {
    
    private let textView = UIView()
    
    private lazy var placeNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    private lazy var placeLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.numberOfLines = 2 
        return label
    }()
    
    private lazy var placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with place: Place) {
        placeNameLabel.text = place.name
        placeLocationLabel.text = place.location
        placeImageView.image = UIImage(named: place.imageName)
        
    }
    
}

//MARK: - Setup views and constraints methods

private extension PlacesTableViewCell {
    
    func setupViews(){
//        contentView.addSubview(textView)
        contentView.addSubview(placeNameLabel)
        contentView.addSubview(placeLocationLabel)
        contentView.addSubview(placeImageView)
    }
    func setupConstraints(){
//        textView.snp.makeConstraints { make in
//            make.top.leading.bottom.equalToSuperview()
//            make.width.equalToSuperview().multipliedBy(0.80)
//        }
        
        placeNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(placeImageView.snp.trailing).offset(25)
            make.top.equalToSuperview().offset(13)
            make.trailing.equalToSuperview()
//            make.bottom.equalTo(placeLocationLabel.snp.top).inset(-40)
        }
        placeLocationLabel.snp.makeConstraints { make in
            make.top.equalTo(placeNameLabel.snp.bottom).inset(20)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(placeImageView.snp.trailing).offset(25)
          
        }
        placeImageView.snp.makeConstraints { make in
//            make.top.trailing.bottom.equalToSuperview()
//            make.leading.equalTo(textView.snp.trailing)
            make.edges.equalToSuperview().multipliedBy(0.15)
            make.width.equalToSuperview().multipliedBy(0.20)
            make.height.equalToSuperview().multipliedBy(0.82)
            make.centerY.equalToSuperview()
            
        }
    }
}
