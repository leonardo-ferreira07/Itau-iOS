//
//  BaseView.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit

open class BaseCell<V: ViewModel>: UITableViewCell, RegisterableCell, View {
    
    open var viewModel: V!
    open func layout() {}
    open func didLoad() {}

    open override func awakeFromNib() {
        super.awakeFromNib()
        didLoad()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
}

open class BaseView<V: ViewModel>: UIView, View {
    
    let activityView = UIActivityIndicatorView(style: .large)

    open var viewModel: V!
    open func layout() {}
    open func didLoad() {}
    
    func startLoading() {
        activityView.startAnimating()
    }
    
    func stopLoading() {
        activityView.stopAnimating()
    }
}

// MARK: - NibInitializableView protocol

public protocol NibInitializableView where Self: UIView {

    //swiftlint:disable:next implicitly_unwrapped_optional
    var contentView: UIView! { get set }

    func setupViewFromNib(named name: String)
}

// MARK: - NibInitializableView default implementation

public extension NibInitializableView {

    func setupViewFromNib(named name: String = String(describing: Self.self)) {

        Bundle.main.loadNibNamed(name, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

