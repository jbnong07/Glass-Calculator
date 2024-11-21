//
//  DisplayLabel.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/21/24.
//
import UIKit

class DisplayLabel: UILabel {
    init() {
        super.init(frame: .zero)
        setLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLabel(){
        text = "0"
        textAlignment = .right
        font = UIFont.systemFont(ofSize: 60, weight: .bold)
        textColor = .white.withAlphaComponent(0.9)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension DisplayLabel {
    func updateDisplayNum(newNum: String) {
        guard let newNum = Double(newNum) else { return }
        let formattedNum = (newNum == floor(newNum) ? String(Int(newNum)) : String(newNum))
        self.text = String(formattedNum)
    }
}
