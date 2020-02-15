//
//  TransitionModel.swift
//  RxMemo
//
//  Created by DONGGUN LEE on 15/02/2020.
//  Copyright © 2020 Tong. All rights reserved.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error{
    case navigationControllerMissing
    case cannotPop
    case unknown
}
