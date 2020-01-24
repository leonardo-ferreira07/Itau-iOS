//
//  RxActivityTracker.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 24/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import RxSwift
import RxCocoa

public struct RxActivityTracker {

    public typealias Element = Bool

    fileprivate let isLoading = BehaviorRelay(value: false)
    fileprivate let loading: Observable<RxActivityTracker.Element>
    private let ignoreNext: Bool

    public init(ignoreNext: Bool = false) {

        self.ignoreNext = ignoreNext

        // Observe occurs in main thread
        loading = isLoading.asObservable()
            .skip(1)
            .observeOn(MainScheduler.instance)
            .distinctUntilChanged()
    }

    fileprivate func trackActivityOfObservable<O: ObservableConvertibleType>(_ source: O) -> Observable<O.Element> {
        return source.asObservable()
            .do(onNext: { [ignoreNext] _ in !ignoreNext ? self.sendStopLoading() : () },
                onError: { _ in self.sendStopLoading() },
                onCompleted: { self.sendStopLoading() },
                onSubscribe: { self.subscribed() })
    }

    private func subscribed() {
        isLoading.accept(true)
    }

    private func sendStopLoading() {
        isLoading.accept(false)
    }
}

extension RxActivityTracker: ObservableType {
    public func subscribe<O>(_ observer: O) -> Disposable
        where O: ObserverType, RxActivityTracker.Element == O.Element {
        return loading.subscribe(observer)
    }

    public func asObservable() -> Observable<RxActivityTracker.Element> {
        return loading.asObservable()
    }
}

extension ObservableConvertibleType {
    public func track(activity activityIndicator: RxActivityTracker) -> Observable<Element> {
        return activityIndicator.trackActivityOfObservable(self)
    }
}

