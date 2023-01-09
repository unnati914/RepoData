//
//  ViewController.swift
//  ios-demo-scroller
//
//  Created by Unnati on 19/10/1944 Saka.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet weak var heightConstant: NSLayoutConstraint!
    let count: CGFloat = 40
    override func viewDidLoad() {
        super.viewDidLoad()
//        heightConstant.constant = ((count) * 43.0)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel!.text = "My Name is Unnati"
        return cell!
    }


}

