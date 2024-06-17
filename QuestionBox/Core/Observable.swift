//
//  Observable.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import Foundation

final class Observable<T> {

    private var observers: [Int: TypedCompletionBlock<T>] = [:]
    private var uniqueID = (0...).makeIterator()

    var value: T {
        didSet {
            observers.values.forEach { $0(value) }
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func observe(_ observer: @escaping TypedCompletionBlock<T>) -> Disposable {
        guard let id = uniqueID.next() else { fatalError("There should always be a next unique id") }

        observers[id] = observer
        observer(value)

        let disposable = Disposable { [weak self] in
            self?.observers[id] = nil
        }

        return disposable
    }

    func removeAllObservers() {
        observers.removeAll()
    }
}
