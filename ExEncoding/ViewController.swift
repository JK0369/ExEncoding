//
//  ViewController.swift
//  ExEncoding
//
//  Created by Jake.K on 2022/02/04.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let myModel = MyModel(userID: "jake", blogName: "iOS 앱 개발 알아가기")
    guard let data = try? JSONEncoder().encode(myModel) else { return }
    let jsonString = String(data: data, encoding: .utf8)
    
    print(jsonString)
    /*
     {\"user_id\":\"jake\",\"blog_info\":{\"name\":{\"first\":\"iOS 앱 개발 알아가기\"}}}
     */
  }
}
