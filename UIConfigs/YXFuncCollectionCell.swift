//
//  YXFuncCollectionCell.swift
//  UIConfigItemDemo
//
//  Created by tezwez on 2019/12/26.
//  Copyright © 2019 tezwez. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class YXFuncCollectionCell: UICollectionViewCell{
    
    lazy var commView: YXFuncCommView = {
        let view = YXFuncCommView(frame: .zero)
        return view
    }()
    
    lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.7)
        return view
    }()
   
    var item: YXUIConfigItem?{
        didSet{
            commView.item = item
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        addSubview(line)
        commView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        line.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
