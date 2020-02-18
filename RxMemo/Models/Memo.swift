//
//  Memo.swift
//  RxMemo
//
//  Created by DONGGUN LEE on 1/31/20.
//  Copyright © 2020 Tong. All rights reserved.
//

import Foundation
import RxDataSources

struct Memo: Equatable, IdentifiableType {
    var content: String
    var insertDate: Date
    var identity: String
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original: Memo, updatedContent: String){
        self = original
        self.content = updatedContent
    }
}
