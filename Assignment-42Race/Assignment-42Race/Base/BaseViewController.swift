//
//  BaseViewController.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import UIKit
import RxSwift

class BaseViewController<VM: ViewModelTransformable>: UIViewController {
    typealias Input = VM.Input
    let disposeBag = DisposeBag()
    let viewModel: VM
    lazy var screenName: String = {"\(Self.self)"}()
    
    init(viewModel: VM, nibName: String? = nil) {
        self.viewModel = viewModel
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        debugPrint("🚀 \(screenName) deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindingUI()
    }
    
    func bindingUI() { }
    
}
