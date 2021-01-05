//
//  Algorithm.swift
//  Algorithm
//
//  Created by Tea on 2021/1/5.
//  Copyright © 2021 Tea. All rights reserved.
//

import UIKit

/// 权重比
struct Weight {
    var weight: Int = 0
    var value: String = ""
}

class Algorithm: NSObject {
    
    /// 根据权重比取出其中一条数据  （抽奖、服务器配置等会用到）
    /// - Parameter items: 数据组
    /// - Returns: Weight
    static func weight(_ items: [Weight]) ->Weight? {
        
        // 最多只有一条数据
        if items.count <= 1 {
            return items.first
        }
        
        // 权重和
        var sum = 1
        for item in items {
            sum += item.weight
        }
        
        /// 得到随机数
        let num = Int(arc4random_uniform(UInt32(sum)) + 1)
        
        /// 区间起始值
        var min = 1
        for item in items {
            let max = min + item.weight
            if num <= max {
                return item
            }
            min = max
        }
        return nil
    }
    
    
    /// 获取一个随机时间 （用于高并发情况，防止同一时间段, 时间间隔时间加上此时间）
    /// - Returns: 时间
    static func interval()-> TimeInterval {
        let num = arc4random_uniform(100)
        let interval = Double(num) *  0.0001
        return interval
    }
    
    
}

