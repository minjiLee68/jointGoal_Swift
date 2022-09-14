//
//  HomeViewController.swift
//  jointGoal_Swift
//
//  Created by 이민지 on 2022/09/01.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    
    var redView = UIView()
    var blueView = UIView()
    var greenView = UIView()
    var pinkView = UIView()
    
    lazy var blueBtn = UIButton().then {
        $0.backgroundColor = .blue
        $0.snp.makeConstraints {
            $0.width.height.equalTo(80)
        }
        $0.layer.cornerRadius = 40
        $0.addTarget(self, action: #selector(blueClick), for: .touchUpInside)
    }
    
    lazy var greenBtn = UIButton().then {
        $0.backgroundColor = .green
        $0.snp.makeConstraints {
            $0.width.height.equalTo(80)
        }
        $0.layer.cornerRadius = 40
        $0.addTarget(self, action: #selector(greenClick), for: .touchUpInside)
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        viewSetting()
        
        snapView()
    }
    
    func snapView() {
        
        view.addSubview(redView)
        redView.snp.makeConstraints {
            
         //   $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(320)
            $0.height.equalTo(380)
            
//            $0.size.equalTo(CGSize(width: 300, height: 100))
//            $0.center.equalTo(self.view)
            
        }
        
        view.addSubview(blueBtn)
        blueBtn.snp.makeConstraints {
            $0.top.equalTo(redView).offset(-40)
            $0.left.equalTo(redView).offset(10)
        }
        
        view.addSubview(greenBtn)
        greenBtn.snp.makeConstraints {
            $0.top.equalTo(redView).offset(-40)
            $0.left.equalTo(blueBtn.snp.right).offset(10)
        }
        
        view.addSubview(pinkView)
        pinkView.snp.makeConstraints {
            $0.top.equalTo(redView).offset(-40)
            $0.left.equalTo(greenBtn.snp.right).offset(10)
            $0.width.height.equalTo(80)
        }
        
        
        
        
        //        blueView.snp.makeConstraints { make in
        //            make.top.equalTo(redView.snp.bottom)
        //            make.size.width.height.equalTo(100)
        //            make.left.equalTo(redView.snp.left)
        //        }
        
    }
    
    func viewSetting() {
        
        redView.backgroundColor = .red
        
        greenView.backgroundColor = .green
        pinkView.backgroundColor = .systemPink
        
        
        greenView.layer.cornerRadius = 40
        pinkView.layer.cornerRadius = 40
    }
}

// MARK: - Function

extension HomeViewController {
    
    @objc func blueClick() {
        self.view.sendSubviewToBack(self.greenBtn)
        self.view.sendSubviewToBack(self.pinkView)
        
        self.view.bringSubviewToFront(self.blueBtn) // 겹쳐있는 자식들 중 하나를 맨 앞으로 이동
    }
    
    @objc func greenClick() {
      
        self.view.bringSubviewToFront(self.greenBtn)
        self.view.sendSubviewToBack(self.blueBtn)
        self.view.sendSubviewToBack(self.pinkView)
     
    }
    
}
