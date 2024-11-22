//
//  CircleButton.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/20/24.
//
import UIKit

class CircleButton: UIButton {
    init(title: String, alpha: CGFloat) {//버튼 생성 시 호출되는 초기화
        super.init(frame: .zero)//오토 레이아웃 사용.zero 입력
        setButton(title: title, alpha: alpha)
    }
    
    required init?(coder: NSCoder) {//코드베이스로 작성 시 사용될 일이 없기 때문에 에러 처리.
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setButton(title: String, alpha: CGFloat) {//버튼 커스텀
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        setTitleColor(.white.withAlphaComponent(0.9), for: .normal)
        setTitleColor(.black.withAlphaComponent(0.9), for: .highlighted)
        backgroundColor = .lightGray.withAlphaComponent(alpha)
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}

extension CircleButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = min(bounds.width, bounds.height) / 2
            layer.cornerRadius = radius
    }
}

