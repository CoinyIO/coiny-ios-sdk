//
//  URLSchemeUtilities.swift
//  CoinySDK
//
//  Created by KEMAL KOCABIYIK on 25.02.2019.
//  Copyright © 2019 KEMAL KOCABIYIK. All rights reserved.
//

import Foundation


public class URLSchemeUtilities {
    static func externalURLScheme() -> String? {
        guard let urlTypes = Bundle.main.infoDictionary?["CFBundleURLTypes"] as? [AnyObject],
            let urlTypeDictionary = urlTypes.first as? [String: AnyObject],
            let urlSchemes = urlTypeDictionary["CFBundleURLSchemes"] as? [AnyObject],
            let externalURLScheme = urlSchemes.first as? String else { return nil }
        
        return externalURLScheme
    }
}
