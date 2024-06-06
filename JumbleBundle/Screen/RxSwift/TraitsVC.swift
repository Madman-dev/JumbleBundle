//
//  TraitsVC.swift
//  JumbleBundle
//
//  Created by Porori on 6/7/24.
//

import UIKit
import RxSwift

// traits are observables with narrower set of behaviors than regular observables
// Sole purpose is to provide clearer way to convey intent of code to readers and API users

// singles - emit either success or error
// useful for one time process

// completable - emit completed or error
// 전달하는 데이터는 없다

// maybe - mix of single and completeable

class TraitsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        emitData()
    }
    
    func emitData() {
        example(of: "Singles") {
            let disposeBag = DisposeBag()
            
            enum FileReadError: Error {
                case fileNotFound, unreadable, encodingFailed
            }
            
            // this creates the Observable that occurs WHEN INTENDED
            func loadText(from name: String) -> Single<String> {
                return Single.create { single in
                    // create expects Disposable return type
                    let disposable = Disposables.create()
                    
                    // changing the file format returns error
                    guard let path = Bundle.main.path(forResource: name, ofType: "txt") else {
                        single(.failure(FileReadError.fileNotFound))
                        return disposable
                    }
                    
                    guard let data = FileManager.default.contents(atPath: path) else {
                        single(.failure(FileReadError.unreadable))
                        return disposable
                    }
                    
                    guard let contents = String(data: data, encoding: .utf8) else {
                        single(.failure(FileReadError.encodingFailed))
                        return disposable
                    }
                    
                    single(.success(contents))
                    return disposable
                }
            }
            
            loadText(from: "Blah")
                .subscribe {
                    switch $0 {
                    case .success(let string):
                        print(string)
                    case .failure(let error):
                        print(error)
                    }
                }
                .disposed(by: disposeBag)
        }
    }
}
