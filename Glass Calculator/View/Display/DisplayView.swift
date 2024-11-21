//
//  DisplayView.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/20/24.
//
import UIKit

class DisplayView: UIView {
    private let displayLabel: DisplayLabel = DisplayLabel()

    init() {
        super.init(frame: .zero)
        setupDisplay()
        setLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDisplay() {
        backgroundColor = .lightGray.withAlphaComponent(0.3)
        layer.cornerRadius = 30
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(displayLabel)
    }
    
    private func setLabel() {
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            displayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            displayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            displayLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    

    func updateDisplay(with text: String) {
        if displayLabel.text?.first == "0" {
            displayLabel.text = text
        } else {
            displayLabel.text? += text
        }
        
    }
}
