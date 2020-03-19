//
//  ViewController.swift
//  UberSignature
//
//  Created by mhlee on 2020/03/19.
//  Copyright © 2020 mhlee. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  lazy var firstSignatureViewController: SignatureDrawingViewController = {
    let vc = SignatureDrawingViewController()
    vc.view.layer.borderColor = UIColor.black.cgColor
    vc.view.layer.borderWidth = 2
    vc.view.layer.masksToBounds = true
    return vc
  }()
  
  lazy var secondSignatureViewController: SignatureDrawingViewController = {
    let vc = SignatureDrawingViewController()
    vc.view.layer.borderColor = UIColor.black.cgColor
    vc.view.layer.borderWidth = 2
    vc.view.layer.masksToBounds = true
    return vc
  }()
  
  lazy var thirdSignatureViewController: SignatureDrawingViewController = {
    let vc = SignatureDrawingViewController()
    vc.view.layer.borderColor = UIColor.black.cgColor
    vc.view.layer.borderWidth = 2
    vc.view.layer.masksToBounds = true
    return vc
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    log.info("")
    
    view.backgroundColor = .white
    
    addChild(firstSignatureViewController)
    addChild(secondSignatureViewController)
    addChild(thirdSignatureViewController)
    
    firstSignatureViewController.didMove(toParent: self)
    secondSignatureViewController.didMove(toParent: self)
    thirdSignatureViewController.didMove(toParent: self)
    
    view.addSubview(firstSignatureViewController.view)
    view.addSubview(secondSignatureViewController.view)
    view.addSubview(thirdSignatureViewController.view)
    
    firstSignatureViewController.view.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(50)
      make.left.equalToSuperview().offset(20)
      make.right.equalToSuperview().offset(-20)
      make.height.equalTo(150)
    }
    
    secondSignatureViewController.view.snp.makeConstraints { make in
      make.top.equalTo(firstSignatureViewController.view.snp.bottom).offset(50)
      make.left.equalToSuperview().offset(20)
      make.right.equalToSuperview().offset(-20)
      make.height.equalTo(150)
    }
    
    thirdSignatureViewController.view.snp.makeConstraints { make in
      make.top.equalTo(secondSignatureViewController.view.snp.bottom).offset(50)
      make.left.equalToSuperview().offset(20)
      make.right.equalToSuperview().offset(-20)
      make.height.equalTo(150)
    }
    
    firstSignatureViewController.delegate = self
    secondSignatureViewController.delegate = self
    thirdSignatureViewController.delegate = self
    
  }
}


extension ViewController: SignatureDrawingViewControllerDelegate {
  func signatureDrawingViewControllerIsEmptyDidChange(controller: SignatureDrawingViewController, isEmpty: Bool) {
    log.info("isEmpty: \(isEmpty)")
  }
}
