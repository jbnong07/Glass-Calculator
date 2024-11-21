//
//  ContentView.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/20/24.
//
/*
 최상위 StackView 아래에 디스플레이 + 4*4의 버튼 + 3*1의 버튼
 */
import UIKit

class ContentView: UIView {
    private var calculatorData: CalculatorData
    private(set) var mainStack: MainStack = MainStack()
    private(set) var display: DisplayView = DisplayView()
    
    init(calculatorData: CalculatorData){
        self.calculatorData = calculatorData
        super.init(frame: .zero)
        setContentView()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setContentView(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func setUI(){
        addSubview(mainStack)
        addSubview(display)
        NSLayoutConstraint.activate([
            display.topAnchor.constraint(equalTo: self.topAnchor),
            display.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            display.heightAnchor.constraint(equalToConstant: 100),
            display.widthAnchor.constraint(equalTo: self.widthAnchor),
            mainStack.topAnchor.constraint(equalTo: display.bottomAnchor,constant: 10),
            mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
