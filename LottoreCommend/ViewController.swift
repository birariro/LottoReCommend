//
//  ViewController.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/22.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var progressView: UIProgressView!
    //@IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        progressView.progressViewStyle = .default
        //progressView.transform = progressView.transform.scaledBy(x: 1, y: 8)
        super.viewDidLoad()
        
     
     
    }
    override func viewDidAppear(_ animated: Bool) {
        progressView.setProgress(0.1, animated: true)
        //todo 최신 정보를 모두 가지고있는지 db에서 확인한다.
        //todo 만약 최신정보를 가지고있지않다면 API 를통해 얻어온다.
        self.progressView.setProgress(1.0, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            
          // 2초 후 실행될 부분
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "StatisticsViewController")
            controller?.modalPresentationStyle = .fullScreen
            controller?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
            self.present(controller!, animated: true)
        }
    
    }
    



}

