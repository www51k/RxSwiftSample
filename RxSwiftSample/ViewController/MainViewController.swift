//
//  MainViewController.swift
//  RxSwiftSample
//
//  Created by www51k on 2021/01/29.
//

import RxCocoa
import RxSwift
import UIKit

class MainViewController: BaseViewController {
    @IBOutlet private weak var currentScoreLabel: UILabel!
    @IBOutlet private weak var countUpButton: UIButton!
    @IBOutlet private weak var countDownButton: UIButton!
    @IBOutlet private weak var countResetButton: UIButton!

    private var viewModel: MainViewModelType = MainViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        bindView()
    }
}

extension MainViewController {
    private func initView() {}

    private func bindView() {
        countUpButton.rx.tap.asSignal()
            .emit(to: viewModel.inputs.scoreUpTrigger)
            .disposed(by: disposeBag)

        countDownButton.rx.tap.asSignal()
            .emit(to: viewModel.inputs.scoreDownTrigger)
            .disposed(by: disposeBag)

        countResetButton.rx.tap.asSignal()
            .emit(to: viewModel.inputs.scoreResetTrigger)
            .disposed(by: disposeBag)

        viewModel.outputs.currentScoreText
            .drive(currentScoreLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
