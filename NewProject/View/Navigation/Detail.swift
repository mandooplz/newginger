//
//  Detail.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import SwiftUI

struct Detail: View {
    var selection : SidebarCategory
    @State var showInspector : Bool = false
    
    var body: some View {
        switch selection {
        case .start:
            StartDetail(showInsepector: $showInspector)
        case .egroup:
            EGroupDetail(showInspector: $showInspector)
        case .rgroup:
            Text("구현 예정입니다.")
        case .vendor:
            VendorDetail(showInsepector: $showInspector)
        case .recipeInfo:
            Recipeinfo()
        case .elementInfo:
            Elementinfo()
        case .vendorInfo:
            Vendorinfo()
        case .generator:
            Text("PlanGenerator View 구현 예정")
        case .calculator:
            Text("PlanCalculator View 구현 에정")
        }
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(selection: .start, showInspector: true)
    }
}
