//
//  CommonViewModel.swift
//  RxMemo
//
//  Created by DONGGUN LEE on 15/02/2020.
//  Copyright © 2020 Tong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CommonViewModel: NSObject{
    let title: Driver<String>
    let sceneCoordinator: ScenceCoordinatorType
    let storage: MemoStorageType
    
    init(title: String, sceneCoordinator: ScenceCoordinatorType, storage: MemoStorageType){
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
        self.storage = storage
    }
}
