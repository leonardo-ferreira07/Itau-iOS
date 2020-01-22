//
//  BaseViewController.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit

open class BaseController<ViewType: UIView & View>: UIViewController, Controller {
    private(set) public var currentView = ViewType()

    open override func loadView() {
        self.view = currentView
    }

    public init(viewModel: ViewType.ViewModel) {
        super.init(nibName: nil, bundle: nil)

        if let nibInitializable = currentView as? NibInitializableView {
            nibInitializable.setupViewFromNib()
        }
        currentView.viewModel = viewModel
        currentView.layout()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        currentView.didLoad()
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

