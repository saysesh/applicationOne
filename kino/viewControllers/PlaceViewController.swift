//
//  PlaceViewController.swift
//  kino
//
//  Created by Saida Yessirkepova on 28.01.2023.
//

import UIKit
import SnapKit

class PlaceViewController: UIViewController, UICollectionViewDelegate {
    
    private let scrollView  = UIScrollView()
    private let contentView = UIView()
    
    private let categoryList = Category.allCases
    
    private lazy var movieSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
//        searchBar.layer.borderWidth = 1
//        searchBar.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search theathres"
        return searchBar
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
//        collectionView.layer.borderWidth = 1
        return collectionView
    }()
    
    private lazy var PlacesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PlacesTableViewCell.self, forCellReuseIdentifier: "ID")
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
//        tableView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
//        tableView.layer.borderWidth = 1
        
        

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate   = self
        PlacesTableView.dataSource        = self
        PlacesTableView.delegate          = self

        view.backgroundColor = .systemBackground
    }
}

//MARK: - Collection view data sourse methods

extension PlaceViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
        cell.configure(with: categoryList[indexPath.row].rawValue)
        cell.backgroundColor = .systemGray6
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        return cell
    }
}

//MARK: - Collection view delegate methods

extension PlaceViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = categoryList[indexPath.row].rawValue
        label.font = UIFont.systemFont(ofSize: 15)
        label.sizeToFit()
        return CGSize(width: label.frame.size.width + 30, height: collectionView.frame.size.height - 15 )
    }
}

//MARK: - Table View DataSource and Delegate  methods

extension PlaceViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DataBase.placeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ID", for: indexPath) as! PlacesTableViewCell
        cell.configure(with: DataBase.placeList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.size.height * 0.10
    }

}

//MARK: - Setup views and constraints methods

private extension PlaceViewController {
    func setupViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(movieSearchBar)
        contentView.addSubview(categoryCollectionView)
        contentView.addSubview(PlacesTableView)
        
    }
    func setupConstraints(){
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(15)
        }
        movieSearchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.06)
            
        }
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(movieSearchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.06)
        }
        PlacesTableView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom)
            make.height.equalTo(view).multipliedBy(0.65)
            make.leading.trailing.bottom.equalToSuperview()
        }

        
    }
}
