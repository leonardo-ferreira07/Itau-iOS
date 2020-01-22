//
//  AwesomeNavigator.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import Foundation

/// A generic navigation type that defines destinations and
/// implementations for navigation to said destinations.
protocol AwesomeNavigator {
    associatedtype Destination

    func navigate(to destination: Destination)
}

