//
//  Task.swift
//  Todo
//
//  Created by Kang on 2022/02/27.
//

import Foundation

struct Task {
    var task: String //할 일
    var isComplete: Bool = false //할 일 체크
    
    init(task: String, isComplete: Bool = false) {
        self.task = task
        self.isComplete = isComplete
    }
}
