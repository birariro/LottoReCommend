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
            var randomNumberList: Set = Set<Int>()
            
            while randomNumberList.count <= 5{
                randomNumberList.insert(Int.random(in: 1...45))
            }
            //정렬
            let array = randomNumberList.sorted()
         
            self.numberView1.image = UIImage(named: "ball_"+String(array[0]))
            self.numberView2.image = UIImage(named: "ball_"+String(array[1]))
            self.numberView3.image = UIImage(named: "ball_"+String(array[2]))
            self.numberView4.image = UIImage(named: "ball_"+String(array[3]))
            self.numberView5.image = UIImage(named: "ball_"+String(array[4]))
            self.numberView6.image = UIImage(named: "ball_"+String(array[5]))
            self.numberViewHidden(enable: false)
            self.animationView.stop()
        }
    }
    
}
