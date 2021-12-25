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
        
        viewModel.validLottoData()
       
        //Progress 값 바인딩
        let binding = viewModel.progressValue.subscribe(onNext: {
            (value) in
            self.progressView.setProgress(value, animated: true)
        })
        
        
        //다음 페이지로 넘어갈 준비가 되었다면 페이지 이동
        let bindingNextPage = viewModel.nextPage.subscribe(onNext: {
            (value) in
            if(value){
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    let controller = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController")
        
                    controller?.modalPresentationStyle = .fullScreen
                    controller?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                    self.present(controller!, animated: true)
                }
                
            }
                       
        })
        
        // 구독 취소
        bindingNextPage.dispose()
        binding.dispose()
    
    }
    



}

