//
//  File.swift
//  
//
//  Created by 신동규 on 2022/01/26.
//

import UIKit

class CropDimmingView: UIView, CropMaskProtocol {
    var innerLayer: CALayer?
    
    var cropShapeType: CropShapeType = .rect
    var imageRatio: CGFloat = 1.0
    
    convenience init(cropShapeType: CropShapeType = .rect, cropRatio: CGFloat = 1.0) {
        self.init(frame: CGRect.zero)
        self.cropShapeType = cropShapeType
        initialize(cropRatio: cropRatio)
    }
    
    func setMask(cropRatio: CGFloat) {
        let layer = createOverLayer(opacity: 0.5, cropRatio: cropRatio)
        self.layer.addSublayer(layer)
        innerLayer = layer
    }
}

