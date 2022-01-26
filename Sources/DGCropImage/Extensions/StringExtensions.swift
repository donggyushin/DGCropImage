//
//  File.swift
//  
//
//  Created by 신동규 on 2022/01/26.
//
import Foundation
extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .module, value: "", comment: "")
    }
}
