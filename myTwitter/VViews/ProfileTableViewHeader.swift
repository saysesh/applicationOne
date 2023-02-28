//
//  ProfileHeader.swift
//  myTwitter
//
//  Created by Saida Yessirkepova on 26.02.2023.
//

import UIKit

class ProfileTableViewHeader: UIView {
    
    private let joinedDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Joined June 2019"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let joinDataImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "calendar", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14))
        imageView.tintColor = .secondaryLabel
        return imageView
    }()
    
    
    private let userBioLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.textColor = .label
        label.text = "CEO and chief engineer of SpaceX"
        return label
    }()
    
    private lazy var usernameLabel = {
        let label = UILabel()
        label.text = "@elonmusk"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var displayNameLable = {
        let label = UILabel()
        label.text = "Elon Musk"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 33
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "musk")
        
        return imageView
    }()

    
    private lazy var profileHeaderImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "planets")
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Setup views and constraints methods

private extension ProfileTableViewHeader {
    func setupViews(){
        addSubview(profileHeaderImageView)
        addSubview(profileImageView)
        addSubview(displayNameLable)
        addSubview(usernameLabel)
        addSubview(userBioLabel)
        addSubview(joinDataImageView)
        addSubview(joinedDataLabel)
    }
    func setupConstraints(){
        profileHeaderImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.50)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(70)
            make.height.equalToSuperview().multipliedBy(0.18)
            make.width.equalToSuperview().multipliedBy(0.180)

        }
        displayNameLable.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
        }
        usernameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalTo(displayNameLable.snp.bottom).offset(5)
        }
        userBioLabel.snp.makeConstraints { make in
            make.leading.equalTo(displayNameLable.snp.leading)
            make.trailing.equalToSuperview().offset(-5)
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
        }
        joinDataImageView.snp.makeConstraints { make in
            make.leading.equalTo(displayNameLable.snp.leading)
            make.top.equalTo(userBioLabel.snp.bottom).offset(5)
        }
        joinedDataLabel.snp.makeConstraints { make in
            make.leading.equalTo(joinDataImageView.snp.trailing).offset(2)
            make.top.equalTo(userBioLabel.snp.bottom).offset(5)

        }
    }
}
