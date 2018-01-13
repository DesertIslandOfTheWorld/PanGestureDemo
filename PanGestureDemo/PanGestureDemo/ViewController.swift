//
//  ViewController.swift
//  PanGestureDemo
//
//  Created by 李云鹏 on 2018/1/11.
//  Copyright © 2018年 cn.iddev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var lastTransformTy: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pan(_:)))
        view.addGestureRecognizer(panGesture)
        
        view.addSubview(subView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @objc func pan(_ panGesture: UIPanGestureRecognizer) {
        if panGesture.state == .began {
            panGesture.setTranslation(CGPoint(x: 0, y: subView.transform.ty), in: subView)
        } else if panGesture.state == .changed {
            let subViewTransformTy = panGesture.translation(in: subView).y
            subView.transform = CGAffineTransform(translationX: 0, y: subViewTransformTy)
        }
    }
    
    lazy var subView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 400, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 400))
        view.backgroundColor = UIColor.blue
        view.layer.cornerRadius = 8
        view.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
        return view
    }()
}

