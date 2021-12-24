//
//  StatisticsView.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/22.
//

import UIKit

class StatisticsViewController : UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var numberList :[String] = []
    let textCellIdentifier = "StatisticsCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberList.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! StatisticsCell
        cell.label.text = numberList[indexPath.row]
        cell.imageViewer.image = UIImage(named: "ball_"+numberList[indexPath.row])
       // cell.textLabel?.text = data[indexPath.row]
        return cell
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        for index in 1..<46{
            numberList.append(String(index))
        }
       
    }


}
