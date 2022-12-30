//
//  ViewController.swift
//  one
//
//  Created by Saida Yessirkepova on 22.12.2022.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    let helloButton = UIButton()
    
    private lazy var AccountMoney: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Account money"
        label.textColor = .white
        return label
    }()
  
    
    private lazy var myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 70)
        label.text = "I am rich"
        label.textColor = .white
        return label
    }()
    
   private lazy  var myDiamond : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "diamond")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemMint
        setupViews()
        setupConstraints()
        helloButton.setTitle("Change", for: .normal)
        helloButton.setTitleColor(.white, for: .normal)
        helloButton.setTitleColor(.systemMint, for: .highlighted)
        helloButton.backgroundColor = .gray
        helloButton.layer.cornerRadius = 8
        helloButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
             
    }
    
    @objc func buttonTapped(){
        AccountMoney.text = "Account : \(Int.random(in: 1000..<10000))$"
        view.backgroundColor = .random()
    }

}
//MARK: Initalisation



private extension ViewController {
    func setupViews(){
        view.addSubview(myLabel)
        view.addSubview(AccountMoney)
        view.addSubview(myDiamond)
        view.addSubview(helloButton)
    }
    func setupConstraints(){
        myLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(myDiamond.snp.top).offset(20)
        }
        AccountMoney.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.78)
        }
        myDiamond.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(1.20)
           
        }
        helloButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().multipliedBy(0.85)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.25)
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
