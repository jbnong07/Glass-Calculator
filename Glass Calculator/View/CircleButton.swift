//
//  CircleButton.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/19/24.
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
    
    private let blurEffectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let view = UIVisualEffectView(effect: effect)
        view.layer.cornerRadius = 100
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setButton(title: String, alpha: CGFloat) {//버튼 커스텀
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .lightGray.withAlphaComponent(alpha)
        layer.cornerRadius = 100
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
        
        insertSubview(blurEffectView, at: 0)//블러처리
        NSLayoutConstraint.activate([
            blurEffectView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurEffectView.topAnchor.constraint(equalTo: topAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addShadow()//내부 그림자 처리
    }
}

extension CircleButton {
    //CALayer에 적용시킨 그림자는 버튼이 동적으로 바뀔 때 재계산되기 위해 메서드로 설정함.
    private func addShadow() {
        let shadow = CALayer()
        shadow.frame = bounds
        shadow.cornerRadius = layer.cornerRadius
        shadow.backgroundColor = UIColor.clear.cgColor
        
        shadow.shadowColor = UIColor.white.withAlphaComponent(0.5).cgColor // 반투명 흰색 그림자
        shadow.shadowOffset = CGSize(width: -2, height: -2)
        shadow.shadowOpacity = 1
        shadow.shadowRadius = 5 // 그림자의 확산 정도
        
        //그림자를 내부로 보이기 위한 마스크레이
        let maskLayer = CALayer()
        maskLayer.frame = bounds.insetBy(dx: -20, dy: -20) // 마스크 크기를 확장하여 내부 그림자 영역 설정
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.cornerRadius = layer.cornerRadius + 20 // 둥근 모서리를 버튼보다 더 크게 설정
        maskLayer.borderColor = UIColor.white.cgColor // 마스크 경계의 색상을 흰색으로 설정
        maskLayer.borderWidth = 20 // 마스크의 경계 너비
        shadow.mask = maskLayer // 그림자 레이어에 마스크 적용
        
        layer.addSublayer(shadow)
    }
    
    // 버튼 크기가 변경될 때 블러 효과와 그림자를 업데이트
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius = min(bounds.width, bounds.height) / 2
            layer.cornerRadius = radius
            blurEffectView.layer.cornerRadius = radius
    }
}

