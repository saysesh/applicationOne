//
//  MySecondCollectionViewCell.swift
//  hw10
//
//  Created by Saida Yessirkepova on 23.01.2023.
//

import UIKit

class MySecondCollectionViewCell: UICollectionViewCell {
    static let identifier = "MySecondCollectionViewCell"
    
    private lazy var imageInCell: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - func for change photos
    func setImage(with string: String) {
        imageInCell.image = UIImage(named: string)
    }

    
}


//MARK: - Setup views and constraints methods

private extension MySecondCollectionViewCell {
    func setupViews(){
        contentView.addSubview(imageInCell)
    }
    func setupConstraints(){
        imageInCell.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}

extension UIColor {
  static func random () -> UIColor {
    return UIColor(
      red: CGFloat.random(in: 0...1),
      green: CGFloat.random(in: 0...1),
      blue: CGFloat.random(in: 0...1),
      alpha: 1.0)
  }
}
