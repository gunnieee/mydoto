//
//  ViewController.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/15.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private let logoImage = UIImageView()
    
    private let checkListButton = SetButton(title: "To Do", fontColor: .link)
    
    private let cmpListButton = SetButton(title: "Completed", fontColor: .link)
    
    private let randomImageButton = SetButton(title: "Image", fontColor: .link)
    
    private let profileVCButton = SetButton(title: "ProfileViewContorller", fontColor: .link)
    
    private let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

private extension MainViewController{
    
    
// set up
    
    func setUp(){
        setUpLogoImageView()
        setUpCheckListButton()
        setUpCmpListButton()
        setUpRandomImageButton()
        setUpProfileVCButton()
    }
    
    func setUpLogoImageView(){
        view.addSubview(logoImage)
        guard let url = URL(string: viewModel.logoURL) else { return }
        logoImage.urlLoad(url: url)
        logoImage.contentMode = .scaleAspectFit
        logoImage.snp.makeConstraints { make in
            make.width.equalTo(Constant.main.logoImageWidth)
            make.height.equalTo(Constant.main.logoImageHeight)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(Constant.defalutHeightPadding * 2)
        }
    }
    
    func setUpCheckListButton(){
        view.addSubview(checkListButton)
        checkListButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(logoImage.snp.bottom).offset(Constant.defalutHeightPadding)
        }
        checkListButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func setUpCmpListButton(){
        view.addSubview(cmpListButton)
        cmpListButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(checkListButton.snp.bottom).offset(Constant.defalutHeightPadding)
        }
        cmpListButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func setUpRandomImageButton(){
        view.addSubview(randomImageButton)
        randomImageButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(cmpListButton.snp.bottom).offset(Constant.defalutHeightPadding)
        }
        randomImageButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func setUpProfileVCButton(){
        view.addSubview(profileVCButton)
        profileVCButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(randomImageButton.snp.bottom).offset(Constant.defalutHeightPadding)
        }
        profileVCButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func buttonTapped(_ button: UIButton){
        print(#function)
        var vc = UIViewController()
        switch button{
        case checkListButton:
            vc = TodolistViewController()
        case cmpListButton:
            vc = CompletedTodolistViewController()
        case randomImageButton:
            vc = RandomImageViewController()
        case profileVCButton:
            vc = ProfileViewController()
        default:
            print("Please connect a new VC")
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
