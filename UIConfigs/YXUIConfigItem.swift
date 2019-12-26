//
//  YXUIConfigItem.swift
//  UIConfigItemDemo
//
//  Created by tezwez on 2019/12/26.
//  Copyright © 2019 tezwez. All rights reserved.
//

import Foundation
import UIKit

let YXTitleFontSize: CGFloat = 14
let YXSubTitleFontSize: CGFloat = 13
let YXBadgeFontSize: CGFloat = 8
let YXIconSize: CGSize = CGSize(width: 26, height: 26)
let YXBadgeSize: CGSize = CGSize(width: 16, height: 16)

let YXPaddingLeft: CGFloat = 16
let YXPaddingRight: CGFloat = 16
let YXGap: CGFloat = 8

protocol UIConfigProtocol {
    var title: String?{get}
    var icon: String?{get}
}
enum UIConfigType {
    case message(_ data: UIConfigProtocol)
    case helper(_ data: UIConfigProtocol)
    case about(_ data: UIConfigProtocol)
    
    func data() -> UIConfigProtocol?{
        switch self {
        case .message(let data):
            return data
        case .helper(let data):
            return data
        case .about(let data):
            return data
        default:
            return nil
        }
    }
    
//    func title() -> String?{
//        switch self {
//        case .message:
//            return "消息中型"
//        case .helper:
//            return "帮助中心"
//        case .about:
//            return "关于我们"
//        default:
//            return nil
//        }
//    }
//
//    func icon() -> String?{
//        switch self {
//        case .message:
//            return "personal_upgrade_partner"
//        case .helper:
//            return "personal_server"
//        default:
//            return nil
//        }
//    }
}

struct YXUIConfigItem: UIConfigProtocol {
    var title: String?
    var icon: String?
    var subTitle: String?
    
    var badge: Int
    init(title: String?, icon: String? = nil, subTitle: String? = nil, badge: Int = 0) {
        self.title = title
        self.icon = icon
        self.subTitle = subTitle
        self.badge = badge
    }
}

