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
    var disposeBag = DisposeBag()
    @IBOutlet weak var progressText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progressViewStyle = .default
       // self.progressText.text = "0 퍼센트"
     
    }
  
       

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.progressText.text = "0 퍼센트"
        self.view.layoutIfNeeded()
  
        progressText.reloadInputViews()
        //viewModel.validLottoData()
       
        //Progress 값 바인딩
        viewModel.validLottoData()
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { (value) in
                            print("\(value) 퍼센트")

                    DispatchQueue.main.async {
                        self.progressText.text = "\(value) 퍼센트"
                        self.progressView.setProgress(0.4, animated: true)
                    }

                        },
                onCompleted: {
                   // DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                        let controller = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController")

                        controller?.modalPresentationStyle = .fullScreen
                        controller?.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                        self.present(controller!, animated: true)
                    //}
                }).disposed(by: disposeBag)


        
    
    }

    



}

