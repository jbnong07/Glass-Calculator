//
//  BackgroundView.swift
//  Glass Calculator
//
//  Created by 박진홍 on 11/20/24.
//
import UIKit

class BackgroundView: UIImageView {
    init(imageName: String = "BackgroundImage"){
        super.init(frame: .zero)
        setBackground(name: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBackground(name: String) {
        image = UIImage(named: name)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
}
