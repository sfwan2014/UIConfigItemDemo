//
//  BannerCell.swift
//  UIConfigItemDemo
//
//  Created by tezwez on 2019/12/26.
//  Copyright © 2019 tezwez. All rights reserved.
//

import UIKit

class BannerCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var banner: SubBannerItem?{
        didSet{
            imageView.image = UIImage(named: banner?.image ?? "")
        }
    }
    
}
