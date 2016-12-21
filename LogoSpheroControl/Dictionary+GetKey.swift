//
//  Dictionary+GetKey.swift
//  LogoSpheroControl
//
//  Created by imac on 20/12/16.
//  Copyright © 2016 STR. All rights reserved.
//

import Foundation

extension Dictionary where Value: Equatable{
    func keyForValue(value: Value) -> [Key]{
        return flatMap { (key: Key, val: Value) -> Key? in
            value == val ? key : nil
        }
    }
}
