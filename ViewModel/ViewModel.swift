//
//  SwiftUIView.swift
//  omgod
//
//  Created by 문관영 on 2023/03/30.
//

import SwiftUI


class UserViewModel : ObservableObject{
    @Published var user : User = User( click : true,count: 99)
}




