//
//  File.swift
//  
//
//  Created by 신동규 on 2022/01/26.
//

import Foundation

enum CropViewStatus {
    case initial
    case rotating(angle: CGAngle)
    case degree90Rotating
    case touchImage
    case touchRotationBoard
    case touchCropboxHandle(tappedEdge: CropViewOverlayEdge = .none)
    case betweenOperation
}

