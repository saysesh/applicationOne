//
//  ProfileViewController.swift
//  myTwitter
//
//  Created by Saida Yessirkepova on 25.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var  profileTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TweetTableViewCell.self, forCellReuseIdentifier: TweetTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        view.backgroundColor = .systemBackground
        let screen = UIScreen.main.bounds.width
        let headerView  = ProfileTableViewHeader(frame: CGRect(x: 0, y: 0, width: screen , height: 380))

        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.tableHeaderView = headerView
        setupViews()
        setupConstraints()

    }
    
}

//MARK: - Profile Table View  delegate and data sourse methods

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        return screenHeight/6

    }

}

//MARK: - Setup views and constraints methods

private extension ProfileViewController {
    func setupViews(){
        view.addSubview(profileTableView)
    }
    func setupConstraints(){
        profileTableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()

        }
    }
}
