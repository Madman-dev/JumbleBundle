//
//  RxSwift + Ext.swift
//  JumbleBundle
//
//  Created by Porori on 6/5/24.
//

import UIKit

extension UIViewController {
    public func example(of description: String, action: () -> Void) {
        print("\n--- Example of:", description, "---")
        action()
    }
}
