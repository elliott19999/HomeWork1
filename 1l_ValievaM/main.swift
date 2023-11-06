//
//  main.swift
//  1l_ValievaM
//
//  Created by Мадина Валиева on 21.09.2023.
//

import Foundation

// Задачи по 10 уроку
struct Queue <T> {
    var items: [T] = []
    
    var isEmpty: Bool {
           return items.isEmpty
       }

       var count: Int {
           return items.count
       }

    mutating func addFirst(item:T) {
        items.append(item)
    }
    mutating func remove () -> T? {
        items.removeLast()
    
    }
    
    subscript(index: Int) -> T? {
           if index >= 0 && index < items.count {
               return items[index]
           } else {
               return nil
           }
       }
   }

var queue = Queue<Int>()
queue.addFirst(item: 5)
queue.addFirst(item: 8)
print(queue.items)



