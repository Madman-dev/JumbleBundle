//
//  FactoryObservableVC.swift
//  JumbleBundle
//
//  Created by Porori on 6/7/24.
//

import UIKit
import RxSwift

class FactoryObservableVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createFactory()
    }
    
    func createFactory() {
        example(of: "deferred") {
            let disposeBag = DisposeBag()
            
            var flip = false
            
            let factory: Observable<Int> = Observable.deferred {
                flip.toggle()
                
                // checks boolean state and return accordingly
                if flip {
                    return Observable.of(1,2,3)
                } else {
                    return Observable.of(4,5,6)
                }
            }
            
            // initially subscribe to 1,2,3
            // toggle flip()
            // return 4,5,6
            // repeat
            for _ in 1...3 {
                factory.subscribe(onNext: {
                    print($0, terminator: "")
                })
                .disposed(by: disposeBag)
                print()
            }
        }
    }
}
