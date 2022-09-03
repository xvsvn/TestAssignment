//
//  FirstChildViewController.swift
//  TestAssignment
//
//  Created by Xasan Xasanov on 02/09/22.
//

import UIKit

class FirstChildViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
 

   
   
       
   let  infoTableView = UITableView()
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(infoTableView)
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        infoTableView.dataSource = self
        infoTableView.delegate = self
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        infoTableView.translatesAutoresizingMaskIntoConstraints = false
        
            }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = infoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row + 1)"
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = "О клинике"
        return title
    }
}
