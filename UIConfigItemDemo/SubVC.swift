//
//  SubVC.swift
//  UIConfigItemDemo
//
//  Created by tezwez on 2019/12/26.
//  Copyright © 2019 tezwez. All rights reserved.
//

import Foundation
import UIKit

struct SubBannerItem {
    var image: String?
    var id: String?
    var title: String?
}

enum SubVCType {
    case banner(SubBannerItem)
    case setting(YXUIConfigItem)
    case server(YXUIConfigItem)
    
    func banner() -> SubBannerItem?{
        switch self {
        case .banner(let data):
            return data
        default:
            return nil
        }
    }
    
    func data() -> UIConfigProtocol?{
        switch self {
        case .setting(let data):
            return data
        case .server(let data):
            return data
        default:
            return nil
        }
    }
}

class SubVC: UIViewController {
    
    var list: [SubVCType] = []
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "BannerCell", bundle: nil), forCellWithReuseIdentifier: "BannerCell")
        collectionView.register(YXFuncCollectionCell.self, forCellWithReuseIdentifier: "YXFuncCollectionCell")
        
        
        list = [.banner(SubBannerItem(image: "my_points_bg", id: "", title: "")),
            .setting(YXUIConfigItem(title: "设置", icon: "personal_safe")),
            .server(YXUIConfigItem(title: "客服中心", icon: "personal_server"))]
    }
    
}

extension SubVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = list[indexPath.row]
        switch type {
        case .banner(let banner):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
            cell.banner = banner
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YXFuncCollectionCell", for: indexPath) as! YXFuncCollectionCell
            cell.item = type.data() as? YXUIConfigItem
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let type = list[indexPath.row]
        switch type {
        case .banner(let banner):
            return CGSize(width: UIScreen.main.bounds.size.width, height: 200)
        default:
            return CGSize(width: UIScreen.main.bounds.size.width, height: 50)
        }
    }
    
}


