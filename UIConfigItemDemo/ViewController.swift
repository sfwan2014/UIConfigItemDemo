//
//  ViewController.swift
//  UIConfigItemDemo
//
//  Created by tezwez on 2019/12/26.
//  Copyright © 2019 tezwez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var list: [UIConfigType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        tableView.register(YXFuncTableCell.self, forCellReuseIdentifier: "YXFuncTableCell")
        
        list = [.message(YXUIConfigItem(title: "消息", icon: "personal_upgrade_partner", subTitle: "介绍内容")),
                .helper(YXUIConfigItem(title: "帮助中心", icon: "personal_server", subTitle: "帮助中心", badge: 28)),
                .about(YXUIConfigItem(title: "关于我们", subTitle: "关于我们内容")), ]
    }

    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YXFuncTableCell") as! YXFuncTableCell
        cell.item = list[indexPath.row].data() as? YXUIConfigItem
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch list[indexPath.row] {
        case .about(_):
            let ctrl = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SubVC")
            self.show(ctrl, sender: nil)
        default:
            break
        }
    }
}

