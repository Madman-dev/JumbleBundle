//
//  TestingViewController.swift
//  JumbleBundle
//
//  Created by Porori on 6/3/24.
//

import Foundation
import UIKit
import RxSwift

class RxObservingObservablesVC: UIViewController {
    
    weak var coordinator: BaseCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        sampleTest()
    }
    
    func notListening() {
        example(of: "just, of, from") {
            let one = 1
            let two = 2
            let three = 3
            
            let observable = Observable<Int>.just(one)
            // not Array type - operator has a variadic operator
            let observable2 = Observable.of(one, two, three)
            let observable3 = Observable.of([one, two, three])
            let observable4 = Observable.from([one, two, three])
        }
    }
    
    func sampleTest() {
        example(of: "subscribe") {
            let one = 4
            let two = 5
            let three = 6
            
            let observable = Observable.of(one, two, three)
            
            /// subscribe로 데이터 변화를 듣는다 > completed까지 출력
//            observable.subscribe { event in
//                // optional value
//                print(event)
//                
//                // non optional value
//                if let element = event.element {
//                    print(element)
//                }
//            }
            
            /// onNext로 결과값을 보낸다
            // non optional value from start
//            observable.subscribe (onNext:{ element in
//                print(element)
//            })
            
            example(of: "empty") {
                let observable = Observable<Void>.empty()
            }
            
            observable.subscribe(
                onNext: { element in
                    print(element)
                },
                onCompleted: {
                    print("끝까지 확인했어요")
                }
            )
            
            // never called or finishes
            example(of: "never") {
                let observable = Observable<Void>.never()
                
                observable.subscribe { element in
                    print(element)
                } onCompleted: {
                    print("최종 완")
                }
            }
            
            // MARK: - Generating observable from range of values
            example(of: "range") {
                let observable = Observable<Int>.range(start: 1, count: 10)
                
                observable.subscribe { i in
                    let n = Double(i)
                    let fibonacci = Int(
                        ((pow(1.61803, n) - pow(0.61803, n)) / 2.34606).rounded()
                    )
                    print(fibonacci)
                }
            }
            
            // MARK: - Manually terminate the observable event by cancelling subscription
            
            example(of: "dispose") {
                let disposable = Observable.of("A", "B", "C")
                
                let subscription = disposable.subscribe { event in
                    print(event)
                }
                
                subscription.dispose()
            }
            
            example(of: "DisposeBag") {
                let disposeBag = DisposeBag()
                
                Observable.of("A", "B", "C")
                    .subscribe {
                        print($0)
                    }
                    .disposed(by: disposeBag)
            }
            
            // This allows the subscription to be cancelled, but will probably leak memory
            // then calling dispose is a bad idea? (manually calling)
            
            enum NewError: Error {
                case anError
            }
            
            example(of: "create") {
                let disposeBag = DisposeBag()
                
                Observable.create { observer in
                    observer.onNext("1")
                    
                    observer.onError(NewError.anError) // comment out for memory leak
                    observer.onCompleted() // comment out for memory leak
                    observer.onNext("?")
                    
                    // defines what happens when observable is terminated or disposed of
                    return Disposables.create()
                }.subscribe(
                    onNext: { print($0) },
                    onError: { print($0) },
                    onCompleted: { print("종료") },
                    onDisposed: { print("버렸어") }
                )
                .disposed(by: disposeBag) // comment out for memory leak
                // first Test > 2nd observer is never called since the observer is called as "completed"
                // second Test > When there is an error, error is called - NOT the completed
                // third Test > when we remove disposebag, onError and completed
                // - the data is called but never ends. This brings out memory leak
            }
        }
    }
}
