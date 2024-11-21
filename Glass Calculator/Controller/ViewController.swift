//
//  ViewController.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/18/24.
//

import UIKit

class ViewController: UIViewController {
    private let contentView = ContentView()
    private let backgroundView = BackgroundView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground(backgroundView: backgroundView)
        setupContentView(contentView: contentView)
        setButtonMethod()
    }
    
}

extension ViewController {//버튼 메서드
    func setButtonMethod() {
        for row in contentView.mainStack.rows {
            for button in row.buttons {
                button.addTarget(self, action: #selector(buttonTabbed(_:)), for: .touchUpInside)
            }
        }
    }
    
    @objc func buttonTabbed(_ sender: UIButton) {//object-c 런타임에서 호출되기 때문에 반드시 @objc를 붙여야 함.
        print("\(String(describing: sender.titleLabel?.text)) was tabbed")
    }
}

extension ViewController {//UI 세팅 메서드
    private func setupBackground(backgroundView: BackgroundView) {
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupContentView(contentView: ContentView) {
        view.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            contentView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.25,constant: 110) // 4:5 비율 + 디스플레이, 스페이스 높이
        ])
    }
}


#Preview {
    ViewController()
}

