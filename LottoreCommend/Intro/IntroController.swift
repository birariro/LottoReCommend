//
//  ViewController.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/22.
//

import UIKit
import RxSwift

class IntroController: UIViewController {
   
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    let viewModel = IntroViewModel()
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubviewToFront(self.indicatorView)
        self.indicatorView.startAnimating()
         
    }
  
       

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
         self.view.layoutIfNeeded()
  
        
        //Progress 값 바인딩
        viewModel.validLottoData()
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { (value) in
                            print("\(value) 회차 완료")

                        },
                onCompleted: {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
               
                        self.indicatorView.stopAnimating()
                        let controller = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController")

                        controller?.modalPresentationStyle = .fullScreen
                        controller?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                        self.present(controller!, animated: true)
                    }
                }).disposed(by: disposeBag)


        
    
    }

    



}

