//
//  MainViewModel.swift
//  RxSwiftSample
//
//  Created by www51k on 2021/01/29.
//

import Foundation
import RxCocoa
import RxSwift

protocol MainViewModelInputs: AnyObject {
    var scoreUpTrigger: PublishRelay<Void> { get }
    var scoreDownTrigger: PublishRelay<Void> { get }
    var scoreResetTrigger: PublishRelay<Void> { get }
}

protocol MainViewModelOutputs: AnyObject {
    var currentScoreText: Driver<String> { get }
}

protocol MainViewModelType: AnyObject {
    var inputs: MainViewModelInputs { get }
    var outputs: MainViewModelOutputs { get }
}

final class MainViewModel: MainViewModelType, MainViewModelInputs, MainViewModelOutputs {
    enum ScoreCountType: Int {
        case up = 1
        case down = -1
        case reset = 0
    }

    private static let scoreDefalut = 0

    var inputs: MainViewModelInputs { self }
    var outputs: MainViewModelOutputs { self }

    // MARK: - Input

    var scoreUpTrigger = PublishRelay<Void>()
    var scoreDownTrigger = PublishRelay<Void>()
    var scoreResetTrigger = PublishRelay<Void>()

    // MARK: - Output

    let currentScoreText: Driver<String>

    private let disposeBag = DisposeBag()
    private let currentScore = BehaviorRelay<Int>(value: scoreDefalut)

    init() {
        currentScoreText = currentScore
            .map { String("\($0)") }
            .asDriver(onErrorDriveWith: .empty())

        Observable.merge(
            scoreUpTrigger.map { _ in ScoreCountType.up },
            scoreDownTrigger.map { _ in ScoreCountType.down },
            scoreResetTrigger.map { _ in ScoreCountType.reset }
        )
        .map { [weak self] value in
            guard let weakSelf = self else { return MainViewModel.scoreDefalut }
            switch value {
            case .reset: return MainViewModel.scoreDefalut
            case .up, .down: return weakSelf.currentScore.value + value.rawValue
            }
        }
        .bind(to: currentScore)
        .disposed(by: disposeBag)
    }
}
