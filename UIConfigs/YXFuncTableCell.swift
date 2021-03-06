//
//  YXFuncTableCell.swift
//  UIConfigItemDemo
//
//  Created by tezwez on 2019/12/26.
//  Copyright © 2019 tezwez. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class YXFuncTableCell: UITableViewCell{
    
    lazy var commView: YXFuncCommView = {
        let view = YXFuncCommView(frame: .zero)
        return view
    }()
   
    var item: YXUIConfigItem?{
        didSet{
            commView.item = item
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        _init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _init()
    }
    
    private func _init(){
        addSubview(commView)
        
        commView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
