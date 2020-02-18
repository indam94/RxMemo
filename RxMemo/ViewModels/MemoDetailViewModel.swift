//
//  MemoDetailViewModel.swift
//  RxMemo
//
//  Created by DONGGUN LEE on 1/31/20.
//  Copyright © 2020 Tong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class MemoDetailViewModel: CommonViewModel{
    
    let memo: Memo
    
    private var formatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "Ko_kr")
        f.dateStyle = .medium
        f.timeStyle = .medium
        return f
    }()
    
    var contents: BehaviorSubject<[String]>.Observer
    
    init(memo: Memo, title: String, sceneCoordinator: ScenceCoordinatorType, storage: MemoStorageType){
        self.memo = memo
        
        contents = BehaviorSubject<[String]>(value: [
            memo.content, formatter.string(from: memo.insertDate)
        ])
        
        super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
    }
    
    lazy var popAction = CocoaAction{[unowned self] in
        return self.sceneCoordinator.close(animated: true).asObservable().map{_ in
            
        }
    }
    
    func performUpdate(memo: Memo) -> Action<String, Void>{
        return Action{input in
            self.storage.update(memo: memo, content: input).subscribe(onNext: {updated in
                self.contents.onNext([
                    updated.content,
                    self.formatter.string(from: updated.insertDate)
                ])
            }).disposed(by: self.rx.disposeBag)
            
            return Observable.empty()
        }
    }
    
    func makeEditAction() -> CocoaAction{
        return CocoaAction{ _ in
            let composeViewModel = MemoComposeViewModel(title: "Edit Memo", content: self.memo.content, sceneCoordinator: self.sceneCoordinator, storage: self.storage, saveAction: self.performUpdate(memo: self.memo))
            
            let composeScene = Scene.compose(composeViewModel)
            
            return self.sceneCoordinator.transition(to: composeScene, using: .modal, animated: true).asObservable().map{_ in}
        }
    }
}
