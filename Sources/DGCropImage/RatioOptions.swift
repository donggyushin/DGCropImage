//
//  File.swift
//  
//
//  Created by 신동규 on 2022/01/26.
//

import Foundation

public struct RatioOptions: OptionSet {
    public let rawValue: Int
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    static public let original = RatioOptions(rawValue: 1 << 0)
    static public let square = RatioOptions(rawValue: 1 << 1)
    static public let extraDefaultRatios = RatioOptions(rawValue: 1 << 2)
    static public let custom = RatioOptions(rawValue: 1 << 3)
    
    static public let all: RatioOptions = [original, square, extraDefaultRatios, custom]
}

