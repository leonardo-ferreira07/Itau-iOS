//
//  ObservableExtension.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 23/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import Foundation
import RxSwift

public enum RxJSONDecoderError: Error {
    case parsingError
}

public extension Observable where Element: Any {
    func mapArray<T: Decodable>(_ type:T.Type) -> Observable<[T]> {
        return self.map { (element) -> [T] in
            let parsedArray: [T]
            do {
                parsedArray = try JSONDecoder().decode([T].self, from: element as! Data)
            } catch {
                throw RxJSONDecoderError.parsingError
            }
            
            return parsedArray
        }
    }
}
