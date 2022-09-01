//
//  HomeViewController.swift
//  jointGoal_Swift
//
//  Created by 이민지 on 2022/09/01.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    var redView = UIView()
    var blueView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(redView)
        self.view.addSubview(blueView)
        
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
    }
    
    func snapView() {
        redView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.size.width.height.equalTo(100)
            make.left.equalTo(view.snp.left)
        }
        
        blueView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom)
            make.size.width.height.equalTo(100)
            make.left.equalTo(redView.snp.left)
        }

    }
}
