//
//  BaseView.swift
//  MovieWorld
//
//  Created by Çağrı Demir on 2.04.2022.
//

import Foundation
import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func configureNib() {
        backgroundColor = .clear
        addSubview(getNib() ?? UIView())
    }
    
    func setup() {}
    
}
