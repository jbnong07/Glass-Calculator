//
//  ViewController.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/18/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundView = BackgroundView()
        let contentView = ContentView()
        
        setupBackground(backgroundView: backgroundView)
        setupContentView(contentView: contentView)
    }
}
extension ViewController {
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
            contentView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.25) // 4:5 비율
        ])
    }
}
#Preview {
    ViewController()
}

