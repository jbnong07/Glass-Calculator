//
//  DisplayView.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/20/24.
//
import UIKit

class DisplayView: UIView {
    // 텍스트 표시를 위한 UILabel
    private let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "123456789" // 초기 텍스트
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        label.textColor = .white.withAlphaComponent(0.9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init() {
        super.init(frame: .zero)
        setupDisplay()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupDisplay() {
        backgroundColor = .lightGray.withAlphaComponent(0.3)
        layer.cornerRadius = 30 // 둥근 모서리
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(displayLabel)

        // UILabel의 제약 조건 설정
        NSLayoutConstraint.activate([
           
            displayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            displayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            displayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            displayLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }

    // 텍스트를 업데이트하는 메서드
    func updateDisplay(with text: String) {
        displayLabel.text = text
    }
}
