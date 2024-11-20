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
    init(){
        super.init(frame: .zero)
        setContentView()
        setButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setContentView(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    private func setButtons(){
        let mainStack = MainStack()
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: self.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
