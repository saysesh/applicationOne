//
//  ImageCell.swift
//  Table View
//
//  Created by Saida Yessirkepova on 15.01.2023.
//

import UIKit

class ImageCell: UITableViewCell {
    
    var photoImageView = UIImageView()
    var photoTitleLabel = UILabel()
    var priceLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(photoImageView)
        addSubview(photoTitleLabel)
        addSubview(priceLabel)
        
        configuratePhotoTitleLabel()
        configuratePhotoImageView()
        setImageConstraints()
        setTextConstraints()
        setPriceConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(image: image){
        photoImageView.image = image.image
        photoTitleLabel.text = image.title
        priceLabel.text      = image.price
    
    }
    
    func configuratePhotoImageView(){
        photoImageView.layer.cornerRadius = 10
        photoImageView.clipsToBounds     = true
    }
    
    func configuratePhotoTitleLabel(){
        photoTitleLabel.font = UIFont.systemFont(ofSize: 20)
        photoTitleLabel.numberOfLines = 0
        photoTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configuratePriceLabel(){
         priceLabel.numberOfLines = 0
         priceLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints(){
        photoImageView.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().multipliedBy(0.80)
            make.width.equalToSuperview().multipliedBy(0.40)
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview().offset(10)
            
        }
    }
    func setTextConstraints (){
        photoTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(photoImageView.snp.trailing).offset(20)
        }
        }
    func setPriceConstraints (){
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(photoImageView.snp.trailing).offset(20)
            make.top.equalTo(photoTitleLabel.snp.bottom).inset(85)
            make.trailing.equalToSuperview()        }
        }
}
