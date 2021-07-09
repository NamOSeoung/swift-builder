//
//  ViewController.swift
//  builder_pattern
//
//  Created by OSeung Nam on 2021/07/07.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view = BuilderTestView()
    }
}
