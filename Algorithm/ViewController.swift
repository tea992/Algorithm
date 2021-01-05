//
//  ViewController.swift
//  Algorithm
//
//  Created by Tea on 2021/1/5.
//  Copyright © 2021 Tea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var reconnectTimeInterval: TimeInterval = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.testWeight()
//        self.testInterval()
        self.testLinkCache()
    }
    
    
    
    /// 测试根据权重比，计算
    func testWeight() {
        let items = [Weight(weight: 1, value: "1"),
                     Weight(weight: 10, value: "10"),
                     Weight(weight: 7, value: "7"),
                     Weight(weight: 5, value: "5"),
                     Weight(weight: 2, value: "2")]
       
        let value = Algorithm.weight(items)
        print(value)
    }
    
    
    /// 测试时间间隔
    func testInterval() {
        
        let interval = Algorithm.interval()
        /// 2^8 = 126 最多重连8次 或者不需要重连、无网络、已经连接成功 都不再重连
        if (reconnectTimeInterval > (256 + interval)) {
            reconnectTimeInterval = 0
            print("终止啦---")
            return
        }
        print(reconnectTimeInterval)
        DispatchQueue.main.asyncAfter(deadline: .now() + reconnectTimeInterval + interval) {
            print("连接中")
            self.reconnectError()
        }
        reconnectTimeInterval = reconnectTimeInterval == 0 ? 2 : (reconnectTimeInterval * 2)
    }
    
    func reconnectError() {
        self.testInterval()
    }
    
    
    func testLinkCache() {
        let cache = LinkMap()
        cache.put("a", 10)
        cache.put("b", 11)
        cache.put("c", 12)
        cache.put("a", 8)
        cache.put("a", 6)
        
        for (key, node) in cache.cache {
            print(key, node.val as Any)
        }
    }
}

