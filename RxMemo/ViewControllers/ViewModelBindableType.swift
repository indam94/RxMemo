//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by DONGGUN LEE on 1/31/20.
//  Copyright © 2020 Tong. All rights reserved.
//

import UIKit

protocol ViewModelBindableType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! {get set}
    func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController{
    mutating func bind(viewModel: Self.ViewModelType){
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
