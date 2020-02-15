//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by DONGGUN LEE on 15/02/2020.
//  Copyright © 2020 Tong. All rights reserved.
//

import Foundation
import RxSwift

protocol ScenceCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}
