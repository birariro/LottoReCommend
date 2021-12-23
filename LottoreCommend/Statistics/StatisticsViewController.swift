//
//  StatisticsView.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/22.
//

import UIKit

class StatisticsViewController : UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }


    
    var data:[String]=["A","V","D"]
    let textCellIdentifier = "StatisticsCell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! StatisticsCell
        cell.label.text = data[indexPath.row]
       // cell.textLabel?.text = data[indexPath.row]
        return cell
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }


}
