//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by DONGGUN LEE on 1/31/20.
//  Copyright © 2020 Tong. All rights reserved.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[MemoSectionModel]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
