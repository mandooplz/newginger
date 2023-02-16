//
//  TableSelector.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/15.
//

import SwiftUI

// Table에서 Row에 더블클릭으로 액션을 적용하고 싶을 때 사용한다.
// 모든 Table Column에 적용해주어야 한다.
struct DoubleTapContainer<Content>: View where Content : View {
    var content : () -> Content
    var doubleTapAction : () -> Void
    
    init(@ViewBuilder content: @escaping () -> Content, doubleTapAction: @escaping () -> Void) {
        self.content = content
        self.doubleTapAction = doubleTapAction
    }
    
    var body: some View {
        HStack {
            content()
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture(count: 2) {
            withAnimation {
                doubleTapAction()
            }
        }
    }
}
