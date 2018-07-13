//
//  Encodable+Extensions.swift
//  CoinySDK
//
//  Created by KEMAL KOCABIYIK on 13.07.2018.
//  Copyright © 2018 KEMAL KOCABIYIK. All rights reserved.
//

import Foundation
extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
