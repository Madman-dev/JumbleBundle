//
//  Challenge.swift
//  JumbleBundle
//
//  Created by Porori on 6/18/24.
//

import Foundation
import RxSwift
import UIKit

class Challenge: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // runSampleCode()
        runDebugCode()
    }
    
    func runSampleCode() {
        // never인 상황에서도 값을 발생할 수 있다는 점
        // do()는 다음 코드로 넘기는 역할을 하는데, 단순히 넘겨주기만 할 뿐, 발생하는 이벤트는 없다.
        example(of: "never") {
            let disposeBag = DisposeBag()
            let observable = Observable<Void>.never()
            
            observable.subscribe(
                // do()를 통해 onSubscribe에서 값을 내보낼 수 있다
                onNext: { element in
                    print(element)
                }, onError: { error in
                    print("error occurred \(error.localizedDescription)")
                }, onCompleted: {
                    print("Completed")
                }, onDisposed: {
                    // 삭제하는 시점에도 출력을 할 수 있다
                    print("element를 삭제했습니다")
                }
            )
            .disposed(by: disposeBag)
        }
    }
    
    func runDebugCode() {
        example(of: "디버깅 테스트") {
            let observable = Observable<Void>.never()
            let disposebag = DisposeBag()
            
            observable.do(onNext: { _ in
                print("이건 언제?")
            }, afterNext: { _ in
                print("이건 언제22?")
            }, onError: { _ in
                print("이건 언제?333")
            }, afterError: { _ in
                print("이건 언제444444?")
            }, onCompleted: {
                print("이건 언제?5555")
            }, afterCompleted: {
                print("이건 언제?66666")
            }, onSubscribe: {
                print("이건 언제?77777")
            }, onSubscribed: {
                print("이건 언제?8888")
            }, onDispose: {
                print("이건 언제?99999")
            }).subscribe { element in
                print(element, "새로운 값?")
            } onError: { _ in
                print("새로운 값?2222")
            } onCompleted: {
                print("새로운 값?3333")
            } onDisposed: {
                print("삭제했습니다.") // 이 친구는 호출이 안되네..?
            }
//            .disposed(by: disposebag)
        }
    }
}
