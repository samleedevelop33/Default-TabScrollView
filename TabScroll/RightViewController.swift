//
//  RightViewController.swift
//  TabScroll
//
//  Created by sam on 2020/12/24.
//

import UIKit

class RightViewController: UIViewController {
    
    var tmpIndex: Int = 0
    @IBOutlet weak var label:UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "\(tmpIndex)"

    }
    


}
