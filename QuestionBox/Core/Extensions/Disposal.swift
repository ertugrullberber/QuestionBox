//
//  Disposal.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

typealias Disposal = [Disposable]

final class Disposable {

    private let dispose: CompletionBlock

    init(_ dispose: @escaping CompletionBlock) {
        self.dispose = dispose
    }

    deinit {
        dispose()
    }

    func add(to disposal: inout Disposal) {
        disposal.append(self)
    }
}
