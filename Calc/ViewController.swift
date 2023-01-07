//
//  ViewController.swift
//  Calc
//
//  Created by Saida Yessirkepova on 03.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 41/255, green: 46/255, blue: 48/255, alpha: 1)
        return view
    }()
    private lazy var grayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 41/255, green: 46/255, blue: 48/255, alpha: 1)
        return view
    }()
    private lazy var buttonOne: UIButton = {
        let button = UIButton()
        button.setTitle("C", for: .normal)
        button.backgroundColor = .systemGray2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
//        button.layer.cornerRadius = 20
        return button
    }()
    private lazy var buttonPlusAndMinus: UIButton = {
        let button = UIButton()
        button.setTitle("+/-", for: .normal)
        button.backgroundColor = .systemGray2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonProzenten: UIButton = {
        let button = UIButton()
        button.setTitle("%", for: .normal)
        button.backgroundColor = .systemGray2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonDivision: UIButton = {
        let button = UIButton()
        button.setTitle("/", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonSeven: UIButton = {
        let button = UIButton()
        button.setTitle("7", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonEight: UIButton = {
        let button = UIButton()
        button.setTitle("8", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonNine: UIButton = {
        let button = UIButton()
        button.setTitle("9", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonMultiply: UIButton = {
        let button = UIButton()
        button.setTitle("x", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonFour: UIButton = {
        let button = UIButton()
        button.setTitle("4", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonFive: UIButton = {
        let button = UIButton()
        button.setTitle("5", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonSix: UIButton = {
        let button = UIButton()
        button.setTitle("6", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonMinus: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonFirst: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonThree: UIButton = {
        let button = UIButton()
        button.setTitle("3", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonPlus: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonZero: UIButton = {
        let button = UIButton()
        button.setTitle("0", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonDot: UIButton = {
        let button = UIButton()
        button.setTitle(",", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonEqual: UIButton = {
        let button = UIButton()
        button.setTitle("=", for: .normal)
        button.backgroundColor = .orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var buttonEmpty: UIButton = {
        let button = UIButton()
        button.setTitle(" ", for: .normal)
        button.backgroundColor = .systemGray3
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    private lazy var orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 41/255, green: 46/255, blue: 48/255, alpha: 1)
        return view
    }()
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 41/255, green: 46/255, blue: 48/255, alpha: 1)
        return view
    }()
    
    private lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 41/255, green: 46/255, blue: 48/255, alpha: 1)
        return view
    }()
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 41/255, green: 46/255, blue: 48/255, alpha: 1)
        return view
    }()
    private lazy var biggerView = UIView()
    private lazy var firstView = UIView()
    private lazy var secondView = UIView()
    private lazy var thirdView = UIView()
    private lazy var fourthView = UIView()
    private lazy var fifthView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraiants()
        view.backgroundColor = .black
        // Do any additional setup after loading the view.
    }


}

//Mark

private extension ViewController {
    func setupViews(){
        view.addSubview(biggerView)
        biggerView.addSubview(whiteView)
        view.addSubview(firstView)
        firstView.addSubview(grayView)
        firstView.addSubview(buttonOne)
        firstView.addSubview(buttonPlusAndMinus)
        firstView.addSubview(buttonProzenten)
        firstView.addSubview(buttonDivision)
        view.addSubview(secondView)
        secondView.addSubview(orangeView)
        secondView.addSubview(buttonSeven)
        secondView.addSubview(buttonEight)
        secondView.addSubview(buttonNine)
        secondView.addSubview(buttonMultiply)
        view.addSubview(thirdView)
        thirdView.addSubview(redView)
        thirdView.addSubview(buttonFour)
        thirdView.addSubview(buttonFive)
        thirdView.addSubview(buttonSix)
        thirdView.addSubview(buttonMinus)
        view.addSubview(fourthView)
        fourthView.addSubview(blueView)
        fourthView.addSubview(buttonFirst)
        fourthView.addSubview(buttonTwo)
        fourthView.addSubview(buttonThree)
        fourthView.addSubview(buttonPlus)
        view.addSubview(fifthView)
        fifthView.addSubview(greenView)
        fifthView.addSubview(buttonZero)
        fifthView.addSubview(buttonEmpty)
        fifthView.addSubview(buttonDot)
        fifthView.addSubview(buttonEqual)
        
    }
    func setupConstraiants(){
        biggerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.safeAreaLayoutGuide.snp.height).dividedBy(3)
            make.bottom.equalTo(firstView.snp.top)
        }
        whiteView.snp.makeConstraints { make in
            make.top.height.trailing.leading.equalToSuperview()
        }
        grayView.snp.makeConstraints { make in
            make.top.height.trailing.leading.equalToSuperview()
        }
        orangeView.snp.makeConstraints { make in
            make.top.height.trailing.leading.equalToSuperview()
        }
        redView.snp.makeConstraints { make in
            make.top.height.trailing.leading.equalToSuperview()
        }
        blueView.snp.makeConstraints { make in
            make.top.height.trailing.leading.equalToSuperview()
        }
        greenView.snp.makeConstraints { make in
            make.top.height.trailing.leading.equalToSuperview()
        }
        
        firstView.snp.makeConstraints { make in
            make.top.equalTo(biggerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
            make.bottom.equalTo(secondView.snp.top)
        }
        
        secondView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
            make.bottom.equalTo(thirdView.snp.top)
        }
        
        thirdView.snp.makeConstraints { make in
            make.top.equalTo(secondView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
            make.bottom.equalTo(fourthView.snp.top)
        }
        fourthView.snp.makeConstraints { make in
            make.top.equalTo(thirdView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
            make.bottom.equalTo(fifthView.snp.top)
        }
        fifthView.snp.makeConstraints { make in
            make.top.equalTo(fourthView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        buttonOne.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(biggerView.snp.bottom)
            make.bottom.equalTo(secondView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonPlusAndMinus.snp.makeConstraints { make in
            make.top.equalTo(biggerView.snp.bottom)
            make.leading.equalTo(buttonOne.snp.trailing).offset(2)
            make.bottom.equalTo(secondView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonProzenten.snp.makeConstraints { make in
            make.top.equalTo(biggerView.snp.bottom)
            make.leading.equalTo(buttonPlusAndMinus.snp.trailing).offset(2)
            make.bottom.equalTo(secondView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonDivision.snp.makeConstraints { make in
            make.top.equalTo(biggerView.snp.bottom)
            make.leading.equalTo(buttonProzenten.snp.trailing).offset(2)
            make.bottom.equalTo(secondView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonSeven.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(2)
            make.leading.equalToSuperview()
            make.bottom.equalTo(thirdView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonEight.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(2)
            make.bottom.equalTo(thirdView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
            make.leading.equalTo(buttonSeven.snp.trailing).offset(2)
        }
        buttonNine.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(2)
            make.bottom.equalTo(thirdView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
            make.leading.equalTo(buttonEight.snp.trailing).offset(2)
        }
        buttonMultiply.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(2)
            make.bottom.equalTo(thirdView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
            make.leading.equalTo(buttonNine.snp.trailing).offset(2)
        }
        buttonFour.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(secondView.snp.bottom).offset(2)
            make.bottom.equalTo(fourthView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonFive.snp.makeConstraints { make in
            make.leading.equalTo(buttonFour.snp.trailing).offset(2)
            make.top.equalTo(secondView.snp.bottom).offset(2)
            make.bottom.equalTo(fourthView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonSix.snp.makeConstraints { make in
            make.leading.equalTo(buttonFive.snp.trailing).offset(2)
            make.top.equalTo(secondView.snp.bottom).offset(2)
            make.bottom.equalTo(fourthView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonMinus.snp.makeConstraints { make in
            make.leading.equalTo(buttonSix.snp.trailing).offset(2)
            make.top.equalTo(secondView.snp.bottom).offset(2)
            make.bottom.equalTo(fourthView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonFirst.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(thirdView.snp.bottom).offset(2)
            make .bottom.equalTo(fifthView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
            
        }
        buttonTwo.snp.makeConstraints { make in
            make.leading.equalTo(buttonFirst.snp.trailing).offset(2)
            make.top.equalTo(thirdView.snp.bottom).offset(2)
            make .bottom.equalTo(fifthView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonThree.snp.makeConstraints { make in
            make.leading.equalTo(buttonTwo.snp.trailing).offset(2)
            make.top.equalTo(thirdView.snp.bottom).offset(2)
            make .bottom.equalTo(fifthView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonPlus.snp.makeConstraints { make in
            make.leading.equalTo(buttonThree.snp.trailing).offset(2)
            make.top.equalTo(thirdView.snp.bottom).offset(2)
            make .bottom.equalTo(fifthView.snp.top)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonZero.snp.makeConstraints { make in
            make.top.equalTo(fourthView.snp.bottom).offset(2)
            make.bottom.equalTo(fifthView.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonEmpty.snp.makeConstraints { make in
            make.top.equalTo(fourthView.snp.bottom).offset(2)
            make.bottom.equalTo(fifthView.snp.bottom)
            make.leading.equalTo(buttonZero.snp.trailing)
            make.width.equalToSuperview().dividedBy(3.9)
        }
        buttonDot.snp.makeConstraints { make in
            make.top.equalTo(fourthView.snp.bottom).offset(2)
            make.bottom.equalTo(fifthView.snp.bottom)
            make.leading.equalTo(buttonEmpty.snp.trailing).offset(2)
            make.width.equalToSuperview().dividedBy(4)
        }
        buttonEqual.snp.makeConstraints { make in
            make.top.equalTo(fourthView.snp.bottom).offset(2)
            make.bottom.equalTo(fifthView.snp.bottom)
            make.leading.equalTo(buttonDot.snp.trailing).offset(2)
            make.width.equalToSuperview().dividedBy(4)
        }
    }
}
