//
//  StartDetail.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/15.
//

import SwiftUI

struct StartDetail: View {
    @ObservedObject var manager : StartManager = StartManager.shared
    @Binding var showInsepector : Bool

    
    var body: some View {
        table
    }
}

extension StartDetail {
    var table : some View {
        EmptyView()
    }
    var inspectorButton : some View {
        Button {
                showInsepector.toggle()
        } label: {
            Label("rightsidebar", systemImage: "sidebar.right")
        }
    }

}

struct StartDetail_Previews: PreviewProvider {
    static var previews: some View {
        StartDetail(showInsepector: .constant(true))
    }
}
