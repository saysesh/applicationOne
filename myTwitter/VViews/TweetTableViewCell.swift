//
//  TweetTableViewCell.swift
//  myTwitter
//
//  Created by Saida Yessirkepova on 21.02.2023.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    static let identifier = "TweetTableViewCell"
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 25.99
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "musk")
        
        return imageView
    }()
    
    
    private lazy var displayNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Elon Musk"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
        
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@elonmusk"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
        
    }()
    
    private lazy var  tweetTextContentLabel: UILabel = {
        let label = UILabel()
        label.text = "This is mockup tweet. Hello world! I need some more lines to cheeck the constraints"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var  replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bubble.left"), for: .normal)
        button.tintColor = .systemGray2
        return button
        
    }()
    
    private lazy var  retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private lazy var  likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()
    
    private lazy var  shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemGray2
        return button
    }()

    
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

private extension TweetTableViewCell {
    
    func setupViews(){
        contentView.addSubview(avatarImageView)
        contentView.addSubview(displayNameLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(tweetTextContentLabel)
        contentView.addSubview(replyButton)
        contentView.addSubview(retweetButton)
        contentView.addSubview(likeButton)
        contentView.addSubview(shareButton)
    }
    func setupConstraints(){
        avatarImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(5)
            make.width.equalToSuperview().multipliedBy(0.133)
            make.height.equalToSuperview().multipliedBy(0.36)
        }
        displayNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(15)
            make.top.equalToSuperview().offset(5)
        }
        userNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(displayNameLabel.snp.trailing).offset(5)
            make.top.equalToSuperview().offset(5)
        }
        tweetTextContentLabel.snp.makeConstraints { make in
            make.top.equalTo(displayNameLabel.snp.bottom).offset(5)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(15)
            make.trailing.equalToSuperview()
        }
        replyButton.snp.makeConstraints { make in
            make.top.equalTo(tweetTextContentLabel.snp.bottom).offset(8)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(15)
        }
        retweetButton.snp.makeConstraints { make in
            make.top.equalTo(tweetTextContentLabel.snp.bottom).offset(8)
            make.leading.equalTo(replyButton.snp.trailing).offset(57)
        }
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(tweetTextContentLabel.snp.bottom).offset(8)
            make.leading.equalTo(retweetButton.snp.trailing).offset(57)
        }
        shareButton.snp.makeConstraints { make in
            make.top.equalTo(tweetTextContentLabel.snp.bottom).offset(8)
            make.leading.equalTo(likeButton.snp.trailing).offset(57)
        }
    }
}
