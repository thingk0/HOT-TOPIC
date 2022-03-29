//
//  SplashViewController.swift
//  HotTopic
//
//  Created by Thing K0 on 2022/03/29.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var splahIcon: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.splahIcon.alpha = 0 // 이미지 투명도 0 에서 시작
        UIView.animate(withDuration: 2.0, delay: 1.5, options: .curveEaseOut, animations: {
            // 동작 애니메이션
            self.splahIcon.alpha = 1 // 이미지 투명도 1 까지
        }, completion: { finished in
            // 애니메이션 종료
            let Storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            guard let VC = Storyboard.instantiateViewController(identifier: "Main") as? NewsViewController else { return }
            VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: false, completion: nil)
            // 뷰자 등장하는 애니메이션 효과인 animated는 false
        })

    }
}
