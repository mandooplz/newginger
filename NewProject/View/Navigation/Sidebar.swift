//
//  Sidebar.swift
//  SampleMacApp2
//
//  Created by 김민우 on 2023/02/14.
//

import SwiftUI

struct Sidebar: View {
    @Binding var selection : Int
    
    var body: some View {
        List(selection: $selection){
            Section("Main") {
                Text("Start").tag(1)
                Text("E.Group").tag(2)
                Text("R.Group").tag(3)
                Text("Vendor").tag(4)
            }
            
            Divider()
            
            Section("Info") {
                Text("Recipes").tag(5)
                Text("Elements").tag(6)
                Text("Vendors").tag(7)
            }
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(selection: .constant(1))
    }
}
