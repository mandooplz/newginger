//
//  Elementinfo.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/16.
//

import SwiftUI

struct Elementinfo: View {
    @State var showInspector : Bool = false

    var body: some View {
        Text("Element의 모든 정보에 대한 테이블이 들어가는 뷰")
    }
}

struct Elementinfo_Previews: PreviewProvider {
    static var previews: some View {
        Elementinfo()
    }
}
