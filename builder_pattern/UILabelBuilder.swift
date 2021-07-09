//
//  UILabelBuilder.swift
//  builder_pattern
//
//  Created by OSeung Nam on 2021/07/09.
//

import Foundation

import UIKit
import SnapKit

protocol BuilderType {
    associatedtype Product
    func build() -> Product
}

extension UILabel {
    typealias Builder = UILabelBuilder
}

class UILabelBuilder: BuilderType {
    
    
    enum FontWeight {
        case regular
        case semiBold
        case bold
    }
    
    
    private var frame: CGRect = .zero
    private var text: String?
    private var textColor: UIColor?
    private var backgroundColor: UIColor?
    private var parentView: UIView?
    private var fontSize: CGFloat = 0
    private var fontWeight: String = "Regular"
    private var maker: ConstraintMaker?
    private var textAlignment: NSTextAlignment = .left
    
    var currentViewSize = UIScreen.main.bounds
    let designDeviceWidthSize:CGFloat = 375  //디자인 기준 width
    let designDeviceHeightSize:CGFloat = 812 //디자인 기준 height

    
    func withText(_ text: String?) -> UILabelBuilder {
        self.text = text
        return self
    }
    
    func withColor(_ textColor: UIColor?) -> UILabelBuilder {
        self.textColor = textColor
        return self
    }
    
    func withBackgroundColor(_ backgroundColor: UIColor?) -> UILabelBuilder {
        self.backgroundColor = backgroundColor
        return self
    }

    func fontWeight(_ fontWeight: FontWeight) -> UILabelBuilder {
        switch fontWeight {
        case .regular :
            self.fontWeight = "Regular"
            break
        case .semiBold:
            self.fontWeight = "SemiBold"
            break
        case .bold:
            self.fontWeight = "Bold"
            break
        }
        return self
    }
    
    func fontSize (_ size: CGFloat) -> UILabelBuilder {
        let standardRatio = (size/designDeviceWidthSize)
        fontSize = currentViewSize.width * standardRatio
        return self
    }
    
    func withParentView(_ parentView: UIView) -> UILabelBuilder {
        self.parentView = parentView
        return self
    }
    
    func textAlignment(_ textAlignment: NSTextAlignment) -> UILabelBuilder {
        self.textAlignment = textAlignment
        return self
    }

    func build() -> UILabel {
        let label: UILabel = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = UIFont(name: "AppleSDGothicNeo-\(String(describing: fontWeight))", size: fontSize)
        label.backgroundColor = backgroundColor
        label.textAlignment = textAlignment
        return label
    }
    
    func getParentView() -> UIView? {
        return parentView
    }
    
    
}
