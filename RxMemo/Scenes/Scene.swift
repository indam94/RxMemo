//
//  Scene.swift
//  RxMemo
//
//  Created by DONGGUN LEE on 15/02/2020.
//  Copyright © 2020 Tong. All rights reserved.
//

import UIKit

enum Scene{
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

extension Scene{
    func instantitate(from storyboard: String = "Main") -> UIViewController{
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .list(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ListNavigation") as? UINavigationController else{
                fatalError()
            }
            guard var listVC = nav.viewControllers.first as? MemoListViewController else{
                fatalError()
            }
            
            listVC.bind(viewModel: viewModel)
            return nav
            
        case .detail(let viewModel):
            guard var detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? MemoDetailViewController else{
                fatalError()
            }
            detailVC.bind(viewModel: viewModel)
            return detailVC
            
        case .compose(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ComposeNavigation") as? UINavigationController else{
                fatalError()
            }
            
            guard var composeVC = nav.viewControllers.first as? MemoComposeViewController else {
                fatalError()
            }
            
            composeVC.bind(viewModel: viewModel)
            return composeVC
        }
        
    }
}
