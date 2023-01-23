//
//  ViewController.swift
//  hw10
//
//  Created by Saida Yessirkepova on 22.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - Data
    let colors : [ColorsAndTexts] = ColorsAndTextForMy.Model()
    let photos: [Photo] = photoBank.allPhotos()
    
    
    private lazy var buttonOne: UIButton = {
        let button = UIButton()
        button.setTitle("Colors and Numbers", for: .normal)
        button.backgroundColor = .systemMint
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 40
        let height = view.frame.size.height/10
        button.frame.size = CGSize(width: height, height: height)
        return button
    }()
    
    private lazy var myCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
        let height = view.frame.size.height/7
        layout.itemSize = CGSize(width: height * 1.2, height: height)
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        
    return collectionView
    }()
    
    private lazy var mySecondCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
        let height = view.frame.size.height/3.9
        layout.itemSize = CGSize(width: height * 0.8, height: height)
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MySecondCollectionViewCell.self, forCellWithReuseIdentifier: MySecondCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        
        collectionView.showsHorizontalScrollIndicator = false
    return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(view.frame.size.height)
        view.backgroundColor = .systemBackground
        myCollectionView.dataSource = self
        myCollectionView.delegate   = self
        mySecondCollectionView.dataSource = self
        
        
        setupViews()
        setupConstraints()
    }
}

//MARK: -  Delegate and Press

extension  ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == myCollectionView {
            let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
            cell.setText(with: colors[indexPath.item].labelName)
            cell.otherColor(with: colors[indexPath.item].backgroundcolor)
        }
    }
    
}


//MARK: - Collection view data sours methods

extension ViewController: UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == myCollectionView {
            return 1
            
        }
       else  if collectionView == mySecondCollectionView {
            return 1
        }
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == myCollectionView{
            return colors.count }
       else if collectionView == mySecondCollectionView{
           return photos.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == myCollectionView {
            guard  let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as?  MyCollectionViewCell else { return UICollectionViewCell()}
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius  = 10
//            cell.backgroundColor     = .systemOrange
            cell.setText(with: "Let's count and name the color!")
            return cell
            
        }
        
        else if collectionView == mySecondCollectionView {
            guard let cell = mySecondCollectionView.dequeueReusableCell(withReuseIdentifier: MySecondCollectionViewCell.identifier, for: indexPath) as? MySecondCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius  = 10
//            cell.backgroundColor     = .random()
            cell.setImage(with: photos[indexPath.item].imageName)
            return cell
        }
        else {return UICollectionViewCell()}
    }
    
    
}


//MARK: - Setup views and constraints methods

private extension ViewController {
    func setupViews(){
        view.addSubview(myCollectionView)
        view.addSubview(mySecondCollectionView)
        view.addSubview(buttonOne)
        
    }
    func setupConstraints(){
        myCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(mySecondCollectionView.snp.top)
            make.height.equalToSuperview().dividedBy(4)
        }
        
        mySecondCollectionView.snp.makeConstraints { make in
            make.top.equalTo(myCollectionView.snp.bottom)
            make.trailing.leading.equalToSuperview()
            make.bottom.equalTo(buttonOne.snp.top)
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        buttonOne.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(85)
            make.centerX.equalToSuperview()
            make.top.equalTo(mySecondCollectionView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalToSuperview().dividedBy(5)
        }
    }
    
}
