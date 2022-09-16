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
    let minSize : CGFloat = 50
    let maxSize : CGFloat = 160
    
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
    
    lazy var pinkBtn = UIButton().then {
        $0.backgroundColor = .systemPink
        $0.snp.makeConstraints {
            $0.width.height.equalTo(80)
        }
        $0.layer.cornerRadius = 40
        $0.addTarget(self, action: #selector(pinkClick), for: .touchUpInside)
    }
    
//    lazy var stackView = UIStackView(arrangedSubviews: [blueBtn, greenBtn, pinkBtn]).then {
//        $0.axis = .horizontal
//        $0.distribution = .fillProportionally
//        $0.alignment = .fill
//
//        $0.spacing = 15
//    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.redView.backgroundColor = .red
        
        snapView()
    }
    
    func snapView() {
        
        view.addSubview(redView)
        redView.snp.makeConstraints {
            
         //   $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-30)
            $0.width.equalTo(320)
            $0.height.equalTo(420)
            
//            $0.size.equalTo(CGSize(width: 300, height: 100))
//            $0.center.equalTo(self.view)
            
        }
        
//        view.addSubview(stackView)
//        stackView.snp.makeConstraints {
//            $0.top.equalTo(redView).offset(-40)
//            $0.centerX.equalTo(redView)
//        }
        
//        blueBtn.snp.makeConstraints {
//            $0.top.equalTo(redView).offset(-40)
//            $0.left.equalTo(redView).offset(10)
//        }

        view.addSubview(greenBtn)
        greenBtn.snp.makeConstraints {
            $0.top.equalTo(redView).offset(-40)
            $0.centerX.equalTo(redView)
            //$0.left.equalTo(blueBtn.snp.right).offset(15)
        }
        
        view.addSubview(blueBtn)
        blueBtn.snp.makeConstraints {
            $0.top.equalTo(redView).offset(-40)
            $0.right.equalTo(greenBtn.snp.left).offset(-15)
        }

        view.addSubview(pinkBtn)
        pinkBtn.snp.makeConstraints {
            $0.top.equalTo(redView).offset(-40)
            $0.left.equalTo(greenBtn.snp.right).offset(15)
        }
        
        //        blueView.snp.makeConstraints { make in
        //            make.top.equalTo(redView.snp.bottom)
        //            make.size.width.height.equalTo(100)
        //            make.left.equalTo(redView.snp.left)
        //        }
        
    }
}

// MARK: - Function

extension HomeViewController {
    
    @objc func blueClick() {
        self.view.bringSubviewToFront(self.blueBtn) // 겹쳐있는 자식들 중 하나를 맨 앞으로 이동
        self.view.sendSubviewToBack(self.greenBtn)
        self.view.sendSubviewToBack(self.pinkBtn)
        
        buttonClickChange(btn: blueBtn, reset: true)
        buttonClickChange(btn: greenBtn, reset: false)
        buttonClickChange(btn: pinkBtn, reset: false)
        
    }
    
    @objc func greenClick() {
      
        self.view.sendSubviewToBack(self.blueBtn)
        self.view.bringSubviewToFront(self.greenBtn)
        self.view.sendSubviewToBack(self.pinkBtn)
        
        buttonClickChange(btn: blueBtn, reset: false)
        buttonClickChange(btn: greenBtn, reset: true)
        buttonClickChange(btn: pinkBtn, reset: false)
        
    }
    
    @objc func pinkClick() {
      
        
        self.view.sendSubviewToBack(self.blueBtn)
        self.view.sendSubviewToBack(self.greenBtn)
        self.view.bringSubviewToFront(self.pinkBtn)
        
        
        buttonClickChange(btn: greenBtn, reset: false)
        buttonClickChange(btn: blueBtn, reset: false)
        buttonClickChange(btn: pinkBtn, reset: true)
     
    }
    
    func buttonClickChange(btn: UIButton, reset: Bool) {
        
        var size : CGFloat = 0
        if reset {
            size = maxSize
        } else {
            size = minSize
        }
//        btn.snp.makeConstraints { (make) in
//                make.left.top.equalTo(15)
//                make.bottom.right.equalTo(-15)
//            }
        btn.snp.makeConstraints {
            $0.width.height.equalTo(size)
            //$0.top.equalTo(redView).offset(-40)
        }
        print("reset \(btn.frame)")
//        btn.layer.cornerRadius = size / 2
//        btn.layer.opacity = reset == true ? 1 : 0.6
    }
}
