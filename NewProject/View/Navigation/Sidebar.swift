//
//  Sidebar.swift
//  SampleMacApp2
//
//  Created by 김민우 on 2023/02/14.
//

import SwiftUI

struct Sidebar: View {
    @Binding var selection : SidebarCategory
    
    var body: some View {
        List(selection: $selection){
            Section("Main") {
                Text("Start").tag(SidebarCategory.start)
                Text("E.Group").tag(SidebarCategory.egroup)
                Text("R.Group").tag(SidebarCategory.rgroup)
                Text("Vendor").tag(SidebarCategory.vendor)
            }
            
            Divider()
            
            Section("Info") {
                Text("Recipes").tag(SidebarCategory.recipeInfo)
                Text("Elements").tag(SidebarCategory.elementInfo)
                Text("Vendors").tag(SidebarCategory.vendorInfo)
            }
            
            Section("Logic") {
                Text("Generator").tag(SidebarCategory.generator)
                Text("Calculator").tag(SidebarCategory.calculator)
            }
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(selection:.constant(.start))
    }
}
