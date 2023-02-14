//
//  Detail.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import SwiftUI

struct Detail: View {
    var selection : Int
    
    var body: some View {
        if selection == 1 {
            Vendor()
        } else {
            Text("구현 예정입니다.")
        }
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(selection: 1)
    }
}
