//
//  ViewController.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/22.
//

import UIKit
import RxSwift

class IntroController: UIViewController {
   
    @IBOutlet weak var progressView: UIProgressView!
    
    let viewModel = IntroViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progressViewStyle = .default
     
    }
  
    override func viewDidAppear(_ animated: Bool) {
        progressView.setProgress(0.0, animated: true)
        
        //Progress 값 바인딩
        viewModel.fetchNumber()
        let binding = viewModel.number.subscribe(onNext: {
            (value) in
            self.progressView.setProgress(value, animated: true)
        })
        
        
        //다음 페이지로 넘어갈 준비가 되었다면
        let bindingNextPage = viewModel.nextPage.subscribe(onNext: {
            (value) in
            if(value){
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController")
    
                controller?.modalPresentationStyle = .fullScreen
                controller?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                self.present(controller!, animated: true)
            }
                       
        })
        
        bindingNextPage.dispose()
        binding.dispose()
        
        //todo 최신 정보를 모두 가지고있는지 db에서 확인한다.
        //todo 만약 최신정보를 가지고있지않다면 API 를통해 얻어온다.
        //self.progressView.setProgress(1.0, animated: true)
        //LotteryModel.init().test()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            
            // 2초 후 실행될 부분
            
//            let controller = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController")
//
//            controller?.modalPresentationStyle = .fullScreen
//            controller?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//            self.present(controller!, animated: true)
            
        }
    
    }
    



}

