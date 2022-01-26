//
//  File.swift
//  
//
//  Created by 신동규 on 2022/01/26.
//

import UIKit

class ImageContainer: UIView {

    lazy private var imageView: UIImageView = {
        let imageView = UIImageView(frame: bounds)
        imageView.layer.minificationFilter = .trilinear
        imageView.accessibilityIgnoresInvertColors = true
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        
        return imageView
    } ()

    var image: UIImage? {
        didSet {
            imageView.frame = bounds
            imageView.image = image
            
            imageView.isUserInteractionEnabled = true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    func contains(rect: CGRect, fromView view: UIView, tolerance: CGFloat = 1e-6) -> Bool {
        let newRect = view.convert(rect, to: self)
        
        let p1 = newRect.origin
        let p2 = CGPoint(x: newRect.maxX, y: newRect.maxY)
        
        let refBounds = bounds.insetBy(dx: -tolerance, dy: -tolerance)
        
        return refBounds.contains(p1) && refBounds.contains(p2)
    }
}

