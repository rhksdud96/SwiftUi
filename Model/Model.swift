//
//  Model.swift
//  omgod
//
//  Created by 문관영 on 2023/03/30.
//

import SwiftUI

struct User {
    var click : Bool = true
    var count : Int = 99
}

struct ProfilePostModel: Identifiable{
    let id = UUID()
    let image : String
    let type : String
}
