//
//  String+Extensions.swift
//  CoinySDK
//
//  Created by KEMAL KOCABIYIK on 12.07.2018.
//  Copyright © 2018 KEMAL KOCABIYIK. All rights reserved.
//

import Foundation

extension String {
    func encodeURIComponent() -> String? {
        let allowedCharacterSet = (CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[] ").inverted)
        
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)
    }
    
}
