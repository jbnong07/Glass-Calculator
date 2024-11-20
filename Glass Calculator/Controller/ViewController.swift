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
        view.addSubview(backgroundView)
        
        // CalculatorContentView 생성
        let calculatorContentView = ContentView()
        calculatorContentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calculatorContentView)
        
        NSLayoutConstraint.activate([
            calculatorContentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculatorContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            calculatorContentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            calculatorContentView.heightAnchor.constraint(equalTo: calculatorContentView.widthAnchor, multiplier: 1.5) // 4:5 비율
        ])
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor) 
        ])
    }
}
extension ViewController {
    private func setupBackground() {
        
    }
}
#Preview {
    ViewController()
}

