//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by DONGGUN LEE on 1/31/20.
//  Copyright © 2020 Tong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel{
    var memoList: Observable<[Memo]>{
        return storage.memoList()
    }
}
