//
//  MovieViewController.swift
//  kino
//
//  Created by Saida Yessirkepova on 28.01.2023.
//

import UIKit
import SnapKit

final class MovieViewController: UIViewController {
    
    var apiCaller = APICaller()
    var movieList: [MovieModel] = []
    
    private let scrollView  = UIScrollView()
    private let contentView = UIView()
    
    private let categoryList = Category.allCases
    
    private lazy var movieSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
//        searchBar.layer.borderWidth = 1
//        searchBar.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search for movies, series, tv shows"
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
    
    private lazy var trendingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TrendingCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
//        collectionView.layer.borderWidth = 1
        
        return collectionView
    }()
    
    private lazy var categoryTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.categoryTableViewCell)
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
//        tableView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
//        tableView.layer.borderWidth = 1
        
        

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate   = self
        trendingCollectionView.dataSource = self
        trendingCollectionView.delegate   = self
        categoryTableView.dataSource      = self
        categoryTableView.delegate        = self
        apiCaller.delegate                = self
        
        apiCaller.fetchRequest()
        setupViews()
        setupConstraints()
        
//        print(movieList)

    }
    
}

//MARK: - API Caller delegate methods

extension MovieViewController: APICallerDelegate {
    func didUpdateMovieList(with movieList: [MovieModel]) {
        self.movieList.append(contentsOf: movieList)
        DispatchQueue.main.async {
            self.trendingCollectionView.reloadData()
        }
        
    }
    
    func didFailWithError(_ error: Error) {
        print("Failed with error: ", error)
    }
}

//MARK: - Collection view data sourse methods

extension MovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
        return categoryList.count
        }
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.categoryCollectionViewCell, for: indexPath) as! CategoryCollectionViewCell
            cell.configure(with: categoryList[indexPath.row].rawValue)
            cell.backgroundColor = .systemGray6
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
//            cell.layer.borderWidth = 1
//            cell.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.trendingCollectionViewCell, for: indexPath) as! TrendingCollectionViewCell
        cell.configure(with: movieList[indexPath.item].backdropPath)
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
}

//MARK: - Collection view delegate methods

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            let label = UILabel()
            label.text = categoryList[indexPath.row].rawValue
            label.font = UIFont.systemFont(ofSize: 15)
            label.sizeToFit()
            return CGSize(width: label.frame.size.width + 30, height: collectionView.frame.size.height - 15 )
        }
        let height = collectionView.frame.size.height
        return CGSize(width: view.frame.size.width * 0.75  , height: height )
    }
}
//MARK: - Table View data sours methods

extension MovieViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryList.count - 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionHeaderView()
        var title = String(categoryList[section + 1].rawValue.dropFirst())
        view.configure(with: title, number: 8)
        return view 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.categoryTableViewCell, for: indexPath) as! CategoryTableViewCell
        
        return cell
    }
    
}

//MARK: - Table view delegates methods

extension MovieViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.3
        
    }
}

//MARK: - Setup views and constraints methods

private extension MovieViewController {
    func setupViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(movieSearchBar)
        contentView.addSubview(categoryCollectionView)
        contentView.addSubview(trendingCollectionView)
        contentView.addSubview(categoryTableView)
        
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
        movieSearchBar.searchTextField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        categoryCollectionView.snp.makeConstraints { make in
            make.top.equalTo(movieSearchBar.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.06)
        }
        trendingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.2)
        }
        categoryTableView.snp.makeConstraints { make in
            make.top.equalTo(trendingCollectionView.snp.bottom).offset(10)
            make.height.equalTo(view).multipliedBy(1.2)
            make.trailing.leading.bottom.equalToSuperview()
        }
    }
}
