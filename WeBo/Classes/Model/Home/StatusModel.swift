//
//  StatusModel.swift
//  WeBo
//
//  Created by Apple on 16/11/4.
//  Copyright © 2016年 叶炯. All rights reserved.
//

import UIKit

class StatusModel: NSObject {

    //MARK:- 属性
    
    var text: String?       //微博的正文
    var mid: Int = 0        //微博的 ID
    var source: String?     //微博的来源
    var created_at: String? //时间处理
    var user: UserModel?    //用户信息
  
    var pic_urls: [[String: String]]? //微博的配图
    var retweeted_status: StatusModel? //微博对应的转发微博
    
    //MARK:- 自定义构造函数   
    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
        
        // 1.将用户字典转成用户模型对象
        if let userDict = dict["user"] as? [String: Any] {
            user = UserModel.init(dict: userDict)
        }
        
        // 2.将转发微博字典转成转发微博模型对象
        if let retweetedStatusDict = dict["retweeted_status"] as? [String: Any] {
            retweeted_status = StatusModel(dict: retweetedStatusDict)
        }
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
