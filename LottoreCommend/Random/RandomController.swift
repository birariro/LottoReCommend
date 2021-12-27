//
//  RandomController.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/27.
//

import Foundation
import UIKit
import Lottie

class RandomController : UIViewController {

    
    @IBOutlet weak var numberView1: UIImageView!
    @IBOutlet weak var numberView2: UIImageView!
    @IBOutlet weak var numberView3: UIImageView!
    @IBOutlet weak var numberView4: UIImageView!
    @IBOutlet weak var numberView5: UIImageView!
    @IBOutlet weak var numberView6: UIImageView!
    @IBOutlet weak var animationView: AnimationView!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        let animation = AnimationView(name: "snowman")
        animationView.animation = animation.animation
        animationView.contentMode = .scaleAspectFill

       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        numberViewHidden(enable: true)
        
    }
    private func numberViewHidden(enable:Bool){
            numberView1.isHidden = enable
            numberView2.isHidden = enable
            numberView3.isHidden = enable
            numberView4.isHidden = enable
            numberView5.isHidden = enable
            numberView6.isHidden = enable
    }
    @IBAction func btnClick(_ sender: Any) {
        numberViewHidden(enable: true)
        animationView.play{ (finish) in
            self.numberViewHidden(enable: false)
        }
    }
    
}
