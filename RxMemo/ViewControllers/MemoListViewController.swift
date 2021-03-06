//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by DONGGUN LEE on 1/31/20.
//  Copyright © 2020 Tong. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController, ViewModelBindableType {
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var viewModel : MemoListViewModel!
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.memoList
            .bind(to: listTableView.rx.items(dataSource: viewModel.dataSource)).disposed(by: rx.disposeBag)
        
        addButton.rx.action = viewModel.makeCreateAction()
        
        Observable.zip(listTableView.rx.modelSelected(Memo.self), listTableView.rx.itemSelected)
            .do(onNext:{[unowned self] (_, indexPath) in
                self.listTableView.deselectRow(at: indexPath, animated: true)
            })
            .map{ $0.0 }
            .bind(to:viewModel.detailAction.inputs)
            .disposed(by: rx.disposeBag)
        
        listTableView.rx.modelDeleted(Memo.self).bind(to: viewModel.deleteAction.inputs).disposed(by: rx.disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
