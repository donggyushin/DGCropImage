//
//  File.swift
//  
//
//  Created by 신동규 on 2022/01/26.
//

import Foundation

struct LocalizedHelper {
    private static var bundle: Bundle?
        
    static func setBundle(_ bundle: Bundle) {
        guard let resourceBundleURL = bundle.url(
            forResource: "DGCropImageResources", withExtension: "bundle")
            else { return }
        LocalizedHelper.bundle = Bundle(url: resourceBundleURL)
    }
    
    static func getString(
        _ key: String,
        localizationConfig: LocalizationConfig = DGCropImage.localizationConfig,
        value: String? = nil
    ) -> String {
        let value = value ?? key

#if SWIFT_PACKAGE
        let bundle = localizationConfig.bundle ?? Bundle.module
        
        return NSLocalizedString(
            key,
            tableName: localizationConfig.tableName,
            bundle: bundle,
            value: value,
            comment: ""
        )
#else
        guard let bundle = LocalizedHelper.bundle ?? (localizationConfig.bundle ?? DGCropImage.bundle) else {
            return value
        }
        
        return NSLocalizedString(
            key,
            tableName: localizationConfig.tableName,
            bundle: bundle,
            value: value,
            comment: ""
        )
#endif
    }
}
