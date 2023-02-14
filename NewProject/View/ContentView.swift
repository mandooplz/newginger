//
//  ContentView.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/14.
//

import SwiftUI

struct ContentView: View {
    @State var selection : Int = 1
    
    var body: some View {
        NavigationSplitView {
            Sidebar(selection: $selection)
        } detail: {
            Detail(selection: selection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
