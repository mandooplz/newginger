//
//  EGroupDetail.swift
//  NewProject
//
//  Created by 김민우 on 2023/02/15.
//

import SwiftUI

struct EGroupDetail: View {
    // manager
    @ObservedObject var manager : EGroupManager = EGroupManager.shared
    
    // selection, sortorder
    @State var elementSortOrder: [KeyPathComparator<Element>] = [.init(\.id, order: SortOrder.forward)]
    @State var elementSelection : Set<Element.ID> = []
    @State var egSortOrder : [KeyPathComparator<ElementGroup>] = [.init(\.id, order: SortOrder.forward)]
    @State var egSelection : Set<ElementGroup.ID> = []
    @State var cegSelection : Set<ElementGroup.ID> = []
    @State var negSelection : Set<ElementGroup.ID> = []
    
    // insepector
    @Binding var showInspector : Bool
    
    // viewMode
    @State var viewMode : ViewMode = .connect
    enum ViewMode : String, CaseIterable, Identifiable {
        var id: Self { self }
        case connect = "point.3.connected.trianglepath.dotted"
        case shift = "shift"
    }
    
    // body
    var body: some View {
        detail
            .toolbar {
                viewModeButton
                refreshButton
                inspectorButton
            }

    }
}

extension EGroupDetail {
    
    @ViewBuilder
    var detail : some View {
        switch viewMode {
        case .connect:
            HStack {
                connectTable
                if showInspector { inspector }
            }
        case .shift:
            HStack{
                Text("CEG, NEG의 테이블이 들어가는 뷰")
                if showInspector { inspector }
            }
        }
    }
    
    var inspector : some View {
        VStack {
            Text("Inspector").font(.title)
            Text("구현 예정입니다.")
        }.frame(width: 200)
    }
    var connectTable : some View {
        HStack {
            Table(selection: $elementSelection, sortOrder: $elementSortOrder) {
                TableColumn("id", value: \.id) { e in
                        Text("\(e.id)")
                }
                
                TableColumn("Name", value: \.name) { e in
                    Text(e.name)
                }
            } rows: {
                ForEach(manager.newElements) { e in
                    TableRow(e)
                }
            }
            
            Table(selection: $egSelection, sortOrder: $egSortOrder) {
                TableColumn("id", value: \.id) { eg in
                    Text("\(eg.id)")
                }
                
                TableColumn("Name", value: \.name) { eg in
                    Text(eg.name)
                }
                
                TableColumn("Category") { eg in
                    Text("\(eg.mainCategory)/\(eg.subCategory)")
                    
                    
                }
            } rows: {
                ForEach(manager.EGs) { eg in
                    TableRow(eg)
                }
            }

        }
    }
    var shiftTable : some View {
        EmptyView()
    }
    var refreshButton : some View {
        Button {
            print("new Elements, ElmentGroup 리스트를 리로딩합니다.")
        } label: {
            Label("reload", systemImage: "arrow.counterclockwise")
        }

    }
    var inspectorButton : some View {
        Button {
            withAnimation {
                showInspector.toggle()
            }
        } label: {
            Label("rightsidebar", systemImage: "sidebar.right")
        }

    }
    var viewModeButton : some View {
        Picker("DisplayMode", selection: $viewMode) {
            ForEach(ViewMode.allCases) { viewMode in
                Label(viewMode.rawValue, systemImage: viewMode.rawValue)
            }
        }.pickerStyle(.segmented)
    }
}

struct EGroupDetail_Previews: PreviewProvider {
    static var previews: some View {
        EGroupDetail(showInspector: .constant(true))
            .frame(width: 1000, height: 600)
    }
}
