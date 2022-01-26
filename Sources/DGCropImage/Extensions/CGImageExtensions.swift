//
//  File.swift
//  
//
//  Created by 신동규 on 2022/01/26.
//

import UIKit

extension CGImage {
    
    func transformedImage(_ transform: CGAffineTransform, zoomScale: CGFloat, sourceSize: CGSize, cropSize: CGSize, imageViewSize: CGSize) -> CGImage? {
        guard var colorSpaceRef = self.colorSpace else {
            return self
        }
        // If the color space does not allow output, default to the RGB color space
        if (!colorSpaceRef.supportsOutput) {
            colorSpaceRef = CGColorSpaceCreateDeviceRGB();
        }
        
        let expectedWidth = floor(sourceSize.width / imageViewSize.width * cropSize.width) / zoomScale
        let expectedHeight = floor(sourceSize.height / imageViewSize.height * cropSize.height) / zoomScale
        let outputSize = CGSize(width: expectedWidth, height: expectedHeight)
        let bitmapBytesPerRow = 0
        
        func getBitmapInfo() -> UInt32 {
            if colorSpaceRef.model == .rgb {
                switch(bitsPerPixel, bitsPerComponent) {
                case (16, 5):
                    return CGImageAlphaInfo.noneSkipFirst.rawValue
                case (32, 8):
                    return CGImageAlphaInfo.premultipliedLast.rawValue
                case (32, 10):
                    if #available(iOS 12, macOS 10.14, *) {
                        return CGImageAlphaInfo.alphaOnly.rawValue | CGImagePixelFormatInfo.RGBCIF10.rawValue
                    } else {
                        return bitmapInfo.rawValue
                    }
                case (64, 16):
                    return CGImageAlphaInfo.premultipliedLast.rawValue
                case (128, 32):
                    return CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.floatComponents.rawValue
                default:
                    return bitmapInfo.rawValue
                }
            }
            
            return bitmapInfo.rawValue
        }
        
        guard let context = CGContext(data: nil,
                                width: Int(outputSize.width),
                                height: Int(outputSize.height),
                                bitsPerComponent: bitsPerComponent,
                                bytesPerRow: bitmapBytesPerRow,
                                space: colorSpaceRef,
                                bitmapInfo: getBitmapInfo()) else {
            return self
        }
                
        context.setFillColor(UIColor.clear.cgColor)
        context.fill(CGRect(x: 0,
                             y: 0,
                             width: outputSize.width,
                             height: outputSize.height))
        
        var uiCoords = CGAffineTransform(scaleX: outputSize.width / cropSize.width,
                                         y: outputSize.height / cropSize.height)
        uiCoords = uiCoords.translatedBy(x: cropSize.width / 2, y: cropSize.height / 2)
        uiCoords = uiCoords.scaledBy(x: 1.0, y: -1.0)
        
        context.concatenate(uiCoords)
        context.concatenate(transform)
        context.scaleBy(x: 1.0, y: -1.0)
        context.draw(self, in: CGRect(x: (-imageViewSize.width / 2),
                                       y: (-imageViewSize.height / 2),
                                       width: imageViewSize.width,
                                       height: imageViewSize.height))
        
        let result = context.makeImage()
        
        return result
    }
}

