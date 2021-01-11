//
//  Sort.swift
//  Algorithm
//
//  Created by Tea on 2021/1/11.
//  Copyright © 2021 Tea. All rights reserved.
//

import UIKit

class Sort: NSObject {

    
    /// 冒泡排序
    static func bubbleSort(_ v: inout[Int]) {
        
        /// 最大长度
        var length = v.count - 1
        /// 需要循环次数
        for i in stride(from: length, to: 0, by: -1) {
            /// 用于标记
            var end = 0
            /// 相邻两位逐渐比较大小
            for j in 1...i {
                let temp = v[j]
                /// 左边大于右边
                if temp < v[j - 1] {
                    /// 交换位置
                    v[j] = v[j-1]
                    v[j - 1]  = temp
                    /// 记录最终的比较位置
                    end = j
                }
            }
            length = end
        }
    }
    
}
