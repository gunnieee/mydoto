//
//  ProfileViewController.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/19.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private struct Constant {
        static var userNamePadding = 10
    }
    
    private struct ConstantString {
        static var userNameText = "nabaecamp"
    }
    
    lazy var userNameLabel = {
        let label = UILabel()
        label.text = ConstantString.userNameText
        return label
    }()
    
    lazy var menuButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Menu"), for: .normal)
        return button
    }()
    
    lazy var userPic = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        return imageView
    }()
    
    lazy var userPostInfo = {
        let infoView = InfoView(text: "post")
        return infoView
    }()
    
    lazy var userFollowInfo = {
        let infoView = InfoView(text: "follower")
        return infoView
    }()
    
    lazy var userFollowingInfo = {
        let infoView = InfoView(text: "following")
        return infoView
    }()
    
    lazy var userInfo = {
        let label = UILabel()
        label.text = """
                     르탄이
                     iOS Developer 🍎
                     spartacodingclub.kr
                     """
        label.numberOfLines = 3
        return label
    }()
    
//    lazy
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(userNameLabel)
        self.view.addSubview(menuButton)
        self.view.addSubview(userPic)
        let userFollowInfo = UIView()
        
        userFollowInfo.addSubview(userPostInfo)
        userFollowInfo.addSubview(userFollowInfo)
        userFollowInfo.addSubview(userFollowingInfo)
        
        self.view.addSubview(userFollowInfo)
        self.view.addSubview(userInfo)
        
        
        self.userNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(Constant.userNamePadding)
        }
        self.menuButton.snp.makeConstraints {
            $0.centerY.equalTo(self.userNameLabel)
            $0.right.equalToSuperview().offset(-16)
        }
        self.userPic.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(14)
            $0.left.equalToSuperview().offset(14)
            $0.width.height.equalTo(88)
        }
        userFollowInfo.snp.makeConstraints {
            $0.centerY.equalTo(self.userPic)
            $0.right.equalToSuperview().offset(-28)
        }
        userInfo.snp.makeConstraints {
            $0.top.equalTo(userPic.snp.bottom).offset(4)
        }
    }
}
