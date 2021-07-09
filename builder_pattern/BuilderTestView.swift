//
//  BuilderTestView.swift
//  builder_pattern
//
//  Created by OSeung Nam on 2021/07/08.
//

import UIKit
import SnapKit

class BuilderTestView: UIView {

    var titleGL:UILabel
        = UILabel.Builder()
        .withText("빌더 테스트")
        .textAlignment(.center)
        .withBackgroundColor(.blue)
        .withColor(.white)
        .fontSize(16)
        .fontWeight(.bold)
        .build()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .yellow
       
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)

        addSubview(titleGL)
        
        titleGL.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.center.equalToSuperview()
        }
    }
}
