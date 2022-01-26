//
//  File.swift
//  
//
//  Created by 신동규 on 2022/01/26.
//
import Foundation
extension String {
    var localized: String {
        if let bundle = bundle {
            return NSLocalizedString(self, tableName: "Localizable", bundle: bundle, value: "", comment: "")
        } else {
            return NSLocalizedString(self, tableName: "Localizable", bundle: .module, value: "", comment: "")
        }
    }
}
