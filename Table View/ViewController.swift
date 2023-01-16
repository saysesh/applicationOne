//
//  ViewController.swift
//  Table View
//
//  Created by Saida Yessirkepova on 15.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let myTitles: [String] = ["Title"]
//    let rowPerSection = [2,4,6]
    
var tableView = UITableView()
    var images: [image] = []
    struct Cells {
        static let imageCell = "ImageCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = fetchData()
        configureTableView()
        
    
    }

    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 200
        tableView.register(ImageCell.self, forCellReuseIdentifier: Cells.imageCell)
        setupConstraints()
    }

    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myTitles.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Menu"
//        switch(section){
//        case 0: return "Breakfast"
//        case 1: return "Salads"
//        case 2: return "Drinks"
//        default: return "----"
//        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return rowPerSection[section]
        return images.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.imageCell) as! ImageCell
        let image = images[indexPath.row]
        cell.set(image: image)
        
        return cell
    }
    

}
//MARK: - Setup constraints methods

private extension ViewController {
    
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
//MARK: - Generating Data

extension ViewController {
    func fetchData() -> [image]{
        let image1 = image(image: Images.breakfast, title: "Венские вафли", price: "3850 тг")
        let image2 = image(image: Images.breakfastTwo, title: "Каша с  ягодами", price: "1650 тг")
        let image3 = image(image: Images.salmon, title: "Филе лосося", price: "6350 тг")
        let image4 = image(image: Images.salad, title: "Теплый салат", price: "3850 тг")
        let image5 = image(image: Images.coctail, title: "Джин Физз", price: "2650 тг")
        let image6 = image(image: Images.coffe, title: "Кофе Раф", price: "1700 тг")
        return [image1,image2,image3,image4,image5,image6]
        
    }
}
