//
//  YXFuncCommView.swift
//  UIConfigItemDemo
//
//  Created by tezwez on 2019/12/26.
//  Copyright © 2019 tezwez. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
class YXFuncCommView: UIView{
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: YXTitleFontSize)
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: YXSubTitleFontSize)
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageV = UIImageView(frame: .zero)
        return imageV
    }()
    
    lazy var detailIcon: UIImageView = {
        let imageV = UIImageView(frame: .zero)
        imageV.image = UIImage(named: "detail_icon")
        return imageV
    }()
    
    lazy var badgeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: YXBadgeFontSize)
        label.textColor = .white
        label.backgroundColor = .red
        label.layer.cornerRadius = YXBadgeSize.height/2.0
        label.layer.masksToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    var item: YXUIConfigItem?{
        didSet{
            titleLabel.text = item?.title
            
            // 图标
            let icon = item?.icon ?? ""
            if icon.count > 0 {
                iconImageView.image = UIImage(named: icon)
                titleLabel.snp.updateConstraints { (make) in
                    make.left.equalToSuperview().offset(YXPaddingLeft+YXIconSize.width+YXGap)
                }
            } else {
                iconImageView.image = nil
                titleLabel.snp.updateConstraints { (make) in
                    make.left.equalToSuperview().offset(YXPaddingLeft)
                }
            }
            
            // 未读数
            let badge = item?.badge ?? 0
            var badgeWidth: CGFloat = 0
            if badge == 0 {
                badgeLabel.text = ""
                badgeLabel.snp.updateConstraints { (make) in
                    make.width.equalTo(0)
                }
            } else {
                let text = "\(badge)"
                badgeLabel.text = text
                badgeWidth = getLabWidth(labelStr: text, font: badgeLabel.font, height: 1000) + 4
                let width = max(badgeWidth, YXBadgeSize.width)
                badgeLabel.snp.updateConstraints { (make) in
                    make.width.equalTo(width)
                }
            }
            // 子标题
            subTitleLabel.text = item?.subTitle
            subTitleLabel.snp.updateConstraints { (make) in
                make.right.equalTo(detailIcon.snp.left).offset(-6-(badgeWidth > 0 ? badgeWidth+6 : 0))
            }
            
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
        
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(badgeLabel)
        addSubview(iconImageView)
        addSubview(detailIcon)
        
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(YXPaddingLeft)
            make.centerY.equalToSuperview()
            make.width.equalTo(YXIconSize.width)
            make.height.equalTo(YXIconSize.height)
        }
        
        detailIcon.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-YXPaddingRight)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(YXPaddingLeft+YXIconSize.width+YXGap)
            make.centerY.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(detailIcon.snp.left).offset(-YXPaddingRight)
        }
        
        badgeLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(detailIcon.snp.left).offset(-6)
            make.width.equalTo(YXBadgeSize.width)
            make.height.equalTo(YXBadgeSize.height)
        }
        
        
    }
    
    //获取字符串Label宽度
    func getLabWidth(labelStr: String, font: UIFont, height:CGFloat) -> CGFloat {
        let statusLabelText: NSString = labelStr as NSString
        let size = CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: height)
        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : Any], context: nil).size
        return strSize.width
    }
}
