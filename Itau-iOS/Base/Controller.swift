//
//  Controller.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

public protocol Controller {
    associatedtype ViewType

    var currentView: ViewType { get }
}

