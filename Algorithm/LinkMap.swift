//
//  LinkMap.swift
//  Algorithm
//
//  Created by Tea on 2021/1/5.
//  Copyright © 2021 Tea. All rights reserved.
//

import UIKit

class LinkNode: NSObject {
    var prev: LinkNode?
    var next: LinkNode?
    var key: String?
    var val: Any?
    
    init(_ key: String, _ val: Any) {
        
        self.key = key
        self.val = val
        self.prev = nil
        self.next = nil
    }

}


class LinkMap: NSObject {
    
    var size: Int = 0
    var capacity: Int = 20
    var cache = [String: LinkNode]()
    var head: LinkNode?
    var tail: LinkNode?
    
    /// 直接插入到表头
    /// - Parameter node: 节点
    private func insertHead(_ node: LinkNode) {
        if head != nil {
            node.next = head
            head?.prev = node
            head = node
        }else {
            head = node
            tail = node
        }
    }
    
    /// 移动到表头
    /// - Parameter node: 节点
    private func bringHead(_ node: LinkNode) {
        if node == head { /// 如果是头节点，无需调换
            return
        }
         /// 如果是尾节点
        if tail === node {
            tail = node.prev
            tail?.next = nil
        }else { /// 中间节点
            node.next?.prev = node.prev
            node.prev?.next = node.next
        }
        
        /// 切换头节点
        node.next = head
        node.prev = nil
        head?.prev = node
        head = node
    }
    
    
    /// 移除节点
    /// - Parameter node: 节点
    private func removeNode(_ node: LinkNode) {
        
        /// 中间节点
        if node.next != nil {
            node.next?.prev = node.prev
            node.prev?.next = node.next
        }

        /// 头结点
        if node === head {
            head = node.next
        }
        
        /// 尾结点
        if node === tail {
            tail = node.prev
        }
    }
    
    
    /// 移除尾节点
    private func removeTailNode() {
        if let key = tail?.key {
            cache.removeValue(forKey: key)
        }
        if tail == head {
            tail = nil
            head = nil
        }else {
            tail = tail?.prev
            tail?.next = nil
        }
    }
    
    
    /// 插入数据
    /// - Parameters:
    ///   - key: key
    ///   - value: value
    func put(_ key: String, _ value: Any) {
        if let node = cache[key] {
            node.val = value
            self.bringHead(node)
        }else {
            let node = LinkNode(key, value)
            cache[key] = node
            self.insertHead(node)
            size += 1
            if size > capacity {
                self.removeTailNode()
            }
        }
    }
    
    /// 取值
    /// - Parameter key: key
    /// - Returns: val
    func get(_ key: String) -> Any? {
        
        guard let node = cache[key] else { return nil }
        bringHead(node)
        return node.val
    }
    


    /// 移除所有
    func removeAll() {
        head = nil
        tail = nil
        size = 0
        cache.removeAll()
    }
    
}
