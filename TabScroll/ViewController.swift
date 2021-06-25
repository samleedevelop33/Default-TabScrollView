//
//  ViewController.swift
//  TabScroll
//
//  Created by sam on 2020/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var count: CGFloat = 6.0//페이지 갯수만큼
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.scrollView.contentSize.width = self.view.frame.width * count
        self.scrollView.isPagingEnabled = true//페이징을 스탭바이 스탭으로 걸리게 만드는 메소드
        
  
        for i in 0..<Int(count) {
            
            if i == 0 {
            guard let leftVC = self.storyboard?.instantiateViewController(withIdentifier: "Left") as? LeftViewController else { return }
            leftVC.tmpIndex = i
            self.addChild(leftVC)
            guard let leftVCView = leftVC.view else { return }
            leftVCView.frame = CGRect(x: 0, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
            self.scrollView.addSubview(leftVCView)
            leftVC.didMove(toParent: self)
            }
            if i >= 1 {
            guard let rightVC = self.storyboard?.instantiateViewController(withIdentifier: "Right") as? RightViewController else { return }
                rightVC.tmpIndex = i
            self.addChild(rightVC)
            guard let rightVCView = rightVC.view else { return }
                rightVCView.frame = CGRect(x: self.view.frame.width * CGFloat(i), y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
            self.scrollView.addSubview(rightVCView)
            rightVC.didMove(toParent: self)
            }
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {

           
        }
        
        
    }//viewDidLoad
    
    
    @IBAction func didTapLeftButton(_ sender: UIButton) {
        self.scrollView.setContentOffset(CGPoint.zero, animated: true)
    }
    
    @IBAction func didTapRightButton(_ sender: UIButton) {
        self.scrollView.setContentOffset(CGPoint(x: self.scrollView.frame.width, y: 0), animated: true)
    }
}


